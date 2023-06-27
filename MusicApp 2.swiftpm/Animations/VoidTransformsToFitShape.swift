

import SwiftUI
//
//  File.swift
//
//
//  Created by mvitoriapereirac on 16/04/23.
//

import SwiftUI

struct VoidTransformsToFitShape: View {
    @State private var circleOffset: CGSize = .zero
    @State private var hexagonOffset: CGSize = .zero
    @State private var octagonOffset: CGSize = .zero
    var circleSpace: CGSize = .zero
    @State var rect: CGRect = CGRect()
    @State var ballInitialPosition = CGRect()
    @State var hexInitialPosition = CGRect()
    @State var octInitialPosition = CGRect()

    @State var selectedShape: String = "circle.fill"
    @State private var animate = false

    
    
    
    var body: some View {
        VStack{
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 5.0, height: 5.0))
                    .foregroundColor(Color.white)
                
                VStack(alignment: .center) {
                GeometryReader { reader in
                   
                        Image(systemName: selectedShape)
                            .resizable()
                            .foregroundColor(Color.gray)
                            .frame(width: 50, height: 50)
                            .offset(circleSpace)
                            .onAppear{
                                withAnimation(.easeIn(duration: 0.5)) {
                                    rect = reader.frame(in: .global)
                                    print("Origin: \(rect.origin)")
                                    animate = true

                                }

                            }
                            .onChange(of: animate) { newValue in
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                    animate = false

                                }
                            }
                    }
                .frame(width: 50, height: 50)


                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

                .frame(alignment: .center)

            }
            .frame(width: 100, height: 60)
            
            HStack {
                GeometryReader { reader in
                    
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color.redPrimary)
                        .frame(width: 50, height: 50)
                        .offset(circleOffset)
                        .onAppear{
                            ballInitialPosition = reader.frame(in: .global)
                            print("Origin: \(ballInitialPosition.origin)")
                            
                        }
                }
                .frame(width: 50, height: 50, alignment: Alignment.center)
                .onAppear{
                    
                }
                    .gesture(
                        DragGesture(coordinateSpace: .global)
                            .onChanged { value in
                                withAnimation(.spring()) {
                                    circleOffset = value.translation
                                    selectedShape = "circle.fill"
                                }
                            }
                            .onEnded { value in
                                withAnimation(.spring()) {
                                    print(value.location)
                                    if value.location.x > rect.origin.x - 50 && value.location.x < rect.origin.x + 50 && selectedShape == "circle.fill"{
                                        if value.location.y > rect.origin.y - 50 && value.location.y < rect.origin.y + 50 {
                                            circleOffset = CGSize(width: rect.origin.x - ballInitialPosition.origin.x, height: rect.origin.y - ballInitialPosition.origin.y)
                                            hexagonOffset = .zero
                                            octagonOffset = .zero
                                        } else {
                                            circleOffset = .zero

                                        }
                                    } else {
                                        circleOffset = .zero

                                    }
                                }
                            }
                    )
                
                
                GeometryReader { reader in
                    
                    Image(systemName: "hexagon.fill")
                        .resizable()
                        .foregroundColor(Color.blue)
                        .frame(width: 50, height: 50)
                        .offset(hexagonOffset)
                        .onAppear{
                            hexInitialPosition = reader.frame(in: .global) 
                            print("Origin: \(hexInitialPosition.origin)")
                            
                        }
                }
                .frame(width: 50, height: 50, alignment: Alignment.center)
                    .gesture(
                        DragGesture(coordinateSpace: .global)
                            .onChanged { value in
                                withAnimation(.spring()) {
                                    hexagonOffset = value.translation
                                    selectedShape = "hexagon.fill"

                                }
                            }
                            .onEnded { value in
                                withAnimation(.spring()) {
                                    print(value.location)
                                    if value.location.x > rect.origin.x - 50 && value.location.x < rect.origin.x + 50 && selectedShape == "hexagon.fill"{
                                        if value.location.y > rect.origin.y - 50 && value.location.y < rect.origin.y + 50 {
                                            hexagonOffset = CGSize(width: rect.origin.x - hexInitialPosition.origin.x, height: rect.origin.y - hexInitialPosition.origin.y)
                                            octagonOffset = .zero
                                            circleOffset = .zero
                                        } else {
                                            hexagonOffset = .zero

                                        }
                                    } else {
                                        hexagonOffset = .zero

                                    }
                                }
                            }
                    )
                
                
                GeometryReader { reader in
                    
                    Image(systemName: "octagon.fill")
                        .resizable()
                        .foregroundColor(Color.accentColor)
                        .frame(width: 50, height: 50)
                        .offset(octagonOffset)
                        .onAppear{
                            octInitialPosition = reader.frame(in: .global) // < in window
                            print("Origin: \(octInitialPosition.origin)")
                            
                        }
                }
                .frame(width: 50, height: 50, alignment: Alignment.center)
                    .gesture(
                        DragGesture(coordinateSpace: .global)
                            .onChanged { value in
                                withAnimation(.spring()) {
                                    octagonOffset = value.translation
                                    selectedShape = "octagon.fill"
                                }
                            }
                            .onEnded { value in
                                withAnimation(.spring()) {
                                    print(value.location)
                                    if value.location.x > rect.origin.x - 50 && value.location.x < rect.origin.x + 50 && selectedShape == "octagon.fill"{
                                        if value.location.y > rect.origin.y - 50 && value.location.y < rect.origin.y + 50 {
                                            octagonOffset = CGSize(width: rect.origin.x - octInitialPosition.origin.x, height: rect.origin.y - octInitialPosition.origin.y)
                                            hexagonOffset = .zero
                                            circleOffset = .zero
                                        } else {
                                            octagonOffset = .zero

                                        }
                                    } else {
                                        octagonOffset = .zero

                                    }
                                }
                            }
                    )
                
                
//                Image(systemName: "hexagon.fill")
//                    .resizable()
//                    .foregroundColor(Color.blue)
//                    .frame(width: 50, height: 50)
//                    .offset(hexagonOffset)
//                    .gesture(
//                        DragGesture()
//                            .onChanged { value in
//                                withAnimation(.spring()) {
//                                    hexagonOffset = value.translation
//                                }
//                            }
//                            .onEnded { value in
//                                withAnimation(.spring()) {
//                                    hexagonOffset = .zero
//                                }
//                            }
//                    )
                
//                Image(systemName: "octagon.fill")
//                    .resizable()
//                    .foregroundColor(Color.orange)
//                    .frame(width: 50, height: 50)
//                    .offset(octagonOffset)
//                    .gesture(
//                        DragGesture()
//                            .onChanged { value in
//                                withAnimation(.spring()) {
//                                    octagonOffset = value.translation
//                                }
//                            }
//                            .onEnded { value in
//                                withAnimation(.spring()) {
//                                    octagonOffset = .zero
//                                }
//                            }
//                    )
            }
            .frame(width: 300)
        }
        
    }
}
