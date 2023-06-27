//
//  SeparatedPeopleAnimation.swift
//  MusicApp
//
//  Created by mvitoriapereirac on 15/04/23.
//

import Foundation
import SwiftUI

struct TwoSeparatePeopleAnimation: View {
    
    @State var moveOnPath = false
    
    var body: some View {
        
        ZStack {
            Circle()
                .stroke()
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .shadow(color: .white, radius: 4.5)
                .opacity(0.5)

            
            Circle()
                .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.accentColor)
                .offset(x: -100)
                .rotationEffect(.degrees(moveOnPath ? 0 : 360))
            Circle()
                .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.redPrimary)
                .offset(x: -100)
                .rotationEffect(.degrees(moveOnPath ? 360 : 0))
                
                .onAppear() {
                    withAnimation(Animation.linear(duration: 4).repeatForever(autoreverses: false)) {
                        moveOnPath.toggle()
                    }
                }
               
        }
//        .frame(width: 100)
        .rotation3DEffect(
            .degrees(70),
            axis: (x: 10, y: 0.5, z: 0.0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TwoSeparatePeopleAnimation()
    }
}
