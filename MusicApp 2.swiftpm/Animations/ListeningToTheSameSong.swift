//
//  File.swift
//  
//
//  Created by mvitoriapereirac on 17/04/23.
//

import SwiftUI

struct ListeningToTheSameSong: View {
    @State private var shouldMove: CGFloat = 0

    var body: some View {
        
        
        VStack (spacing: 20) {
            CirclesPyramidView(move: $shouldMove)
                
//                .frame(maxHeight: 300)
            
            Button(action: {
                
                shouldMove = -400
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
                    shouldMove = 0
                })


                    }) {
                        Image(systemName: "play.circle")
                            .renderingMode(.original)
                            .resizable()
                            .foregroundColor(Color.redPrimary)
                            .frame(110)
                    }
        }
        
    }
}
