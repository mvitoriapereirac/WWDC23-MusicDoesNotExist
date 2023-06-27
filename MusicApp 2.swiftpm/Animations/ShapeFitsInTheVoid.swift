//
//  File.swift
//  
//
//  Created by mvitoriapereirac on 16/04/23.
//

import SwiftUI

struct shapeFitsInTheVoid: View {
    @State private var circleOffset: CGSize = .zero
    @State private var hexagonOffset: CGSize = .zero
    @State private var octagonOffset: CGSize = .zero
    var circleSpace: CGSize = .zero
    @State var rect: CGRect = CGRect()
    @State var ballInitialPosition = CGRect()
    
    
    
    var body: some View {
        VStack{
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 5.0, height: 5.0))
                    .foregroundColor(Color.white)
                
                VStack(alignment: .center) {
                GeometryReader { reader in
                   
                        Image(systemName: "circle.fill")
                            .resizable()
                            .foregroundColor(Color.gray)
                            .frame(width: 50, height: 50)
                            .offset(circleSpace)
                            .onAppear{
                                rect = reader.frame(in: .global) // < in window
                                print("Origin: \(rect.origin)")
                                
                            }
                    }
                .frame(width: 50, height: 50)


                    
                    // let rect = gp.frame(in: .local) // < own bounds
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

//                .background(Color.purple)
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
                            ballInitialPosition = reader.frame(in: .global) // < in window
                            print("Origin: \(ballInitialPosition.origin)")
                            
                        }
                }
                .frame(width: 50, height: 50, alignment: Alignment.center)
                    .gesture(
                        DragGesture(coordinateSpace: .global)
                            .onChanged { value in
                                withAnimation(.spring()) {
                                    circleOffset = value.translation
                                }
                            }
                            .onEnded { value in
                                withAnimation(.spring()) {
                                    print(value.location)
                                    if value.location.x > rect.origin.x - 50 && value.location.x < rect.origin.x + 50 {
                                        if value.location.y > rect.origin.y - 50 && value.location.y < rect.origin.y + 50 {
                                            circleOffset = CGSize(width: rect.origin.x - ballInitialPosition.origin.x, height: rect.origin.y - ballInitialPosition.origin.y)
                                        } else {
                                            circleOffset = .zero

                                        }
                                    } else {
                                        circleOffset = .zero

                                    }
                                }
                            }
                    )
                
                Image(systemName: "hexagon.fill")
                    .resizable()
                    .foregroundColor(Color.blue)
                    .frame(width: 50, height: 50)
                    .offset(hexagonOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.spring()) {
                                    hexagonOffset = value.translation
                                }
                            }
                            .onEnded { value in
                                withAnimation(.spring()) {
                                    hexagonOffset = .zero
                                }
                            }
                    )
                
                Image(systemName: "octagon.fill")
                    .resizable()
                    .foregroundColor(Color.accentColor)
                    .frame(width: 50, height: 50)
                    .offset(octagonOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.spring()) {
                                    octagonOffset = value.translation
                                }
                            }
                            .onEnded { value in
                                withAnimation(.spring()) {
                                    octagonOffset = .zero
                                }
                            }
                    )
            }
            .frame(width: 300)
        }
        
    }
}
