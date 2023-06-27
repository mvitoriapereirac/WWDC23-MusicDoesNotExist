//
//  File.swift
//
//
//  Created by mvitoriapereirac on 17/04/23.
//

//


import SwiftUI

import PureSwiftUI

struct PlayView: View {

    @State private var animate = false
    @State private var rotation: Double = 0
    @State private var trim: CGFloat = 1
    @State var rect: CGRect = CGRect()
    @State var playButtonInitialPosition = CGRect()
    @State var playButtonOffset: CGSize = .zero
    @State var isDraggable = false
    @State var imageName = "play.fill"
    @State var sizeCircleLoopY: CGFloat = 150
    @State var sizeCircleLoopX: CGFloat = 0



    var body: some View {
        GeometryReader { reader in
            ZStack {

                ZStack {
                    Circle()
                        .trim(from: 0, to: trim)
                        .stroke(lineWidth: 7)
                        .foregroundColor(Color.redPrimary)
                        .frame(100)
                        .rotate(.degrees(rotation - 90.0))
                        .overlay(
                    Image(systemName: imageName)
                        .renderingMode(.original)
                        .resizable()
                        .foregroundColor(Color.redPrimary)
                        .frame(width: 45, height: 55)
                    )
                    if isDraggable{
                        LoopCircle(sizeY: $sizeCircleLoopY, sizeX: $sizeCircleLoopX)

                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0, execute: {
                                    withAnimation(.easeInOut(duration: 1.5)){
                                        
                                        
                                    }
                                })
                            }
                    }
                }
                .rotate(.degrees(rotation))

                
            }
            
            .offset(playButtonOffset)
            .onTapGesture {
                withAnimation(Animation.linear(duration: 0.5)) {
                    if self.animate {
                        self.rotation = 0
                        self.trim = 1
                    } else {
                        self.rotation = 180
                        self.trim = 0
                    }
                    isDraggable.toggle()

                    self.animate.toggle()
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 7.0, execute: {
                        self.rotation = 0
                        self.trim = 1
                        isDraggable.toggle()

                        self.animate.toggle()
                        playButtonOffset = .zero
                        
                    })
                    
                    
                }
            }
            
            .gesture(
            DragGesture(coordinateSpace: .global)
                .onChanged { newValue in
                    if isDraggable {
                        withAnimation(.easeIn) {
                            playButtonOffset = newValue.translation
                            sizeCircleLoopY = newValue.location.y * 0.5
                            sizeCircleLoopX = newValue.location.x * 0.5
                        }
                        

                    } else {
                        playButtonOffset = .zero
                    }
                }
                .onEnded { value in
                    withAnimation(.easeIn) {
                        sizeCircleLoopY = value.location.y * 0.5
                        sizeCircleLoopX = value.location.x * 0.5
                    }
                    
                    
                    
                }
            )
            .onAppear{
                playButtonInitialPosition = reader.frame(in: .global) // < in window
                print("Origin: \(rect.origin)")
                
            }
            .onChange(of: animate) { newValue in
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
                    if isDraggable {
                        imageName = ""

                    } else {
                        imageName = "play.fill"
                    }
                })

                
            }
        }
        .frame(50)
        
            }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}

