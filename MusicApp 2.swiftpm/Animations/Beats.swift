//
//  File.swift
//  
//
//  Created by mvitoriapereirac on 15/04/23.
//

import SwiftUI


struct Beats: View {
    @State private var height: CGFloat = 0
    
    let animationSpeed: Double = 0.3
    let maxHeight: CGFloat
    let minHeight: CGFloat
    let width: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: width / 5)
                .frame(width: width, height: height)
                .animation(.easeInOut(duration: animationSpeed), value: height)
                .foregroundColor(.white)
                .shadow(color: Color.white, radius: 4.5)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: animationSpeed, repeats: true) { _ in
                        height = CGFloat.random(in: minHeight...maxHeight)
                    }
                }
        }
        .frame(height: maxHeight, alignment: .bottom)
    }
}
