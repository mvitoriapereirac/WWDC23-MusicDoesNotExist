//
//  ContentView.swift
//  Shared
//
//
import AVKit
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var coordinator: Coordinator
    let items = Array(0..<360)
    let projectFont = CustomFont()


    @State var currentIndex = 0
    @State var timer: Timer?
    @State var shouldShowTitle = false
    @State var shouldShowButton = false



    
    var body: some View {
        VStack(spacing: 300) {
            
            ZStack {
                
        
                ForEach(0...currentIndex, id: \.self) { i in
                    Beats(maxHeight: 25, minHeight: 1, width: 1)
                        .offset(y: 250)
                        .rotationEffect(.degrees(1 * Double(i)))
                        .onAppear{
                            withAnimation(.easeInOut(duration: 1.0)) {
                                timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                                                    currentIndex += 1

                                                    if currentIndex >= items.count {
                                                        currentIndex = items.count - 1
                                                        shouldShowTitle = true
                                                        timer?.invalidate()
                                                    }
                                                }
                            }
                            
                            
//                           
                        }
                }
                if shouldShowTitle{
                    VStack(spacing: 20){
                        HStack(spacing: 4) {
                            ForEach(0..<5) { i in
                                Beats(maxHeight: 75, minHeight: 10, width: 15)
                            }
                        }
                        if shouldShowButton {
                            VStack {
                                Text("MUSIC")
                                    .foregroundColor(Color.redPrimary)
                                    .font(projectFont.setProjectFont(fontSize: 40))
                                    .shadow(color: .redPrimary, radius: 4.5)
                                Text("DOES NOT EXIST")
                                    .font(projectFont.setProjectFont(fontSize: 20))

                                    .foregroundColor(Color.redPrimary)
                                
                            }
                            
                        }
                        
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0, execute: {
                            withAnimation(.easeInOut(duration: 2.0)) {
                                shouldShowButton = true
                            }
                        })
                        
                        }
                    }
                
                
                
                
                
            }
            if shouldShowButton {
                HStack(spacing: 50){
                    Button("Ready?") {
                        coordinator.goTo(view: .levelOne)
                        
                    }
                    .titleFont(Color.redPrimary)
                    .fontSize(30)
                    
                    
                    Button("Credits") {
                        coordinator.goToCreditsPage()
                    }
                    .titleFont(Color.cgLightGray).fontSize(15)
                    
                }
                .scaledToFill()
            }
            
            
            
            
        }
        .onAppear {
            Soundtrack.shared.playSound()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.darkBackground)
        
    }
        
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
