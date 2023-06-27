//
//  File.swift
//  
//
//  Created by mvitoriapereirac on 18/04/23.
//


import SwiftUI

struct LoopCircle: View {
    
    @State private var animate: Bool = false
    
    let count: Int = 15
    @Binding var sizeY: CGFloat
    @Binding var sizeX: CGFloat

    let lineWidth: CGFloat = 6
    let animationDuration: Double = 2
    let colorArray = [Color.red, Color.redPrimary, Color.white, Color.orange, Color.pink, Color.yellow, Color.green, Color.blue, Color.purple, Color.pink, Color.red, Color.redPrimary, Color.white, Color.orange, Color.pink]

    var body: some View {
        ZStack {
            Color.clear.edgesIgnoringSafeArea(.all)
            ForEach(0..<count, id: \.self) { i in
                Circle()
                    .stroke(lineWidth: lineWidth)
                    .frame(width: sizeY, height: sizeY)
                    .foregroundColor(colorArray[i])
                    .offset(x: sizeX / 2.5, y: sizeY / 2.5)
                    .rotationEffect(.degrees(animate ? 360 : 0))
                    
                    .animation(animation(i), value: animate)
                    .opacity(opacity(i))
            }
        }
        .onAppear { animate  = true }
    }

    func opacity(_ i: Int) -> Double {
        Double(i) * (1.0 / Double(count))
    }
    
    func animation(_ i: Int) -> Animation {
        .linear(duration: animationDuration).repeatForever(autoreverses: false).delay(Double(count - i) * (animationDuration / Double(count - 1)))
    }
}
