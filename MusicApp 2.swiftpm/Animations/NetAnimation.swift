//
//  File.swift
//  
//
//  Created by mvitoriapereirac on 18/04/23.
//


import SwiftUI

struct NetAnimation: View {
    
    
    
    @State private var ball1Pos: CGFloat = -75
    @State private var ball2Pos: CGFloat = 0
    @State private var ball3Pos: CGFloat = 75
    @State private var ball4Pos: CGFloat = 150
    @State var ballColor = Color.white
    
    var body: some View {
        ZStack {
            Color.darkBackground
                .edgesIgnoringSafeArea(.all)
            

            
            Circle()
                .fill(Color.red)
                .frame(width: 30, height: 30)
                .offset(x: 0, y: ball1Pos)
            
            Circle()
                .fill(Color.yellow)
                .frame(width: 30, height: 30)
                .offset(x: 0, y: ball2Pos)
            
            Circle()
                .fill(Color.blue)
                .frame(width: 30, height: 30)
                .offset(x: 0, y: ball3Pos)
            
//
            
            Ball(ballColor: $ballColor)
            
        }
        .onAppear {
            ballColor = Color.white
            self.animate()
            Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { _ in
                self.animate()
            }
        }
    }
    func animate() {
        withAnimation(Animation.linear(duration: 1.0)) {
            self.ball1Pos = -150
            ballColor = Color.red
        }
        withAnimation(Animation.easeInOut(duration: 0.5).delay(0.5)) {
            self.ball2Pos = -75
            ballColor = Color.orange

        }
        withAnimation(Animation.easeInOut(duration: 0.5).delay(1.0)) {
            self.ball3Pos = 0
            ballColor = Color.brown
        }
        withAnimation(Animation.easeInOut(duration: 0.5).delay(1.5)) {
            self.ball4Pos = 75
            ballColor = Color.clear
        }
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 2.0) {
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                self.ball4Pos = 150
            }
            withAnimation(Animation.easeInOut(duration: 0.5).delay(0.5)) {
                self.ball3Pos = 75
            }
            withAnimation(Animation.easeInOut(duration: 0.5).delay(1.0)) {
                self.ball2Pos = 0
            }
            withAnimation(Animation.easeInOut(duration: 0.5).delay(1.5)) {
                self.ball1Pos = -75
            }
        }
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        NetAnimation()
    }
}

struct Ball: View {
    let lightGradient = Gradient(colors: [Color(UIColor(red: 0.01, green: 0.67, blue: 0.69, alpha: 1.00)),
                                          Color(UIColor(red: 0.00, green: 0.80, blue: 0.67, alpha: 1.00))])
    @State private var flag = false
    @Binding var ballColor : Color 
    
    var body: some View {
        ZStack {
            Circle()
                .fill(ballColor)
                .frame(width: 30, height: 30).offset(x: -15, y: -15)
                .modifier(Follow(pct: self.flag ? 1 : 0, path: BallPath.createPath(in: CGRect(x: 0, y: 0, width: 100, height: 300))))
                .offset(x: -35, y: -135)
                .onAppear {
                    withAnimation(Animation.linear(duration: 4.0).repeatForever(autoreverses: false)) {
                        self.flag.toggle()
                    }
            }
        }
    }
}

struct Follow: GeometryEffect {
    var pct: CGFloat = 0
    let path: Path

    var animatableData: CGFloat {
        get { return pct }
        set { pct = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let pt = percentPoint(pct)
        return ProjectionTransform(CGAffineTransform(translationX: pt.x, y: pt.y))
    }

    func percentPoint(_ percent: CGFloat) -> CGPoint {

        let pct = percent > 1 ? 0 : (percent < 0 ? 1 : percent)

        let f = pct > 0.999 ? CGFloat(1-0.001) : pct
        let t = pct > 0.999 ? CGFloat(1) : pct + 0.001
        let tp = path.trimmedPath(from: f, to: t)

        return CGPoint(x: tp.boundingRect.midX, y: tp.boundingRect.midY)
    }
}

struct BallPath: Shape {
    func path(in rect: CGRect) -> Path {
        return BallPath.createPath(in: rect)
    }

    static func createPath(in rect: CGRect) -> Path {

        let heightFactor = rect.size.height/8
        let midX = rect.midX

        var path = Path()

        path.move(to: CGPoint(x: midX, y: rect.minY))
        
        path.addArc(center: CGPoint(x: midX, y: heightFactor), radius: heightFactor, startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: false)
        
        path.addArc(center: CGPoint(x: midX, y: heightFactor*3), radius: heightFactor, startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
        
        path.addArc(center: CGPoint(x: midX, y: heightFactor*5), radius: heightFactor, startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: false)
        
        path.addArc(center: CGPoint(x: midX, y: heightFactor*7), radius: heightFactor, startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
        
        
        path.addArc(center: CGPoint(x: midX, y: heightFactor*7), radius: heightFactor, startAngle: .degrees(90), endAngle: .degrees(-90), clockwise: true)
        
        path.addArc(center: CGPoint(x: midX, y: heightFactor*5), radius: heightFactor, startAngle: .degrees(90), endAngle: .degrees(-90), clockwise: false)
        
        path.addArc(center: CGPoint(x: midX, y: heightFactor*3), radius: heightFactor, startAngle: .degrees(90), endAngle: .degrees(-90), clockwise: true)
        
        path.addArc(center: CGPoint(x: midX, y: heightFactor), radius: heightFactor, startAngle: .degrees(90), endAngle: .degrees(-90), clockwise: false)
        
        return path
    }
}
