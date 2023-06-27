//
//  File 2.swift
//  
//
//  Created by mvitoriapereirac on 17/04/23.
//

import SwiftUI

struct CirclesPyramidView: View {
    
    @Binding var move: CGFloat
    
    var body: some View {
        ZStack {
        
            ZStack {
                Circle() // One. No delay
                    .stroke(lineWidth: 5)
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)))
                    .offset(y: CGFloat(move))
                    .animation(Animation.easeInOut(duration: 1.5).repeatCount(1 ,autoreverses: true))
                
                Circle() // Two. 0.1 delay
                    .stroke(lineWidth: 5)
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)))
                    .offset(y: CGFloat(move))
                    .animation(Animation.easeInOut(duration: 1.5).repeatCount(1 ,autoreverses: true).delay(0.1))
                
                Circle() // Three. 0.2 delay
                    .stroke(lineWidth: 5)
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color(#colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1)))
                    .offset(y: CGFloat(move))
                    .animation(Animation.easeInOut(duration: 1.5).repeatCount(1 ,autoreverses: true).delay(0.2))
                
                Circle() // Four. 0.3 delay
                    .stroke(lineWidth: 5)
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color(#colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 1)))
                    .offset(y: CGFloat(move))
                    .animation(Animation.easeInOut(duration: 1.5).repeatCount(1 ,autoreverses: true).delay(0.3))
                
                Circle() // Five. 0.4 delay
                    .stroke(lineWidth: 5)
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color(#colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)))
                    .offset(y: CGFloat(move))
                    .animation(Animation.easeInOut(duration: 1.5).repeatCount(1 ,autoreverses: true).delay(0.4))
                
                Circle() // Six. 0.5 delay
                    .stroke(lineWidth: 5)
                    .frame(width: 70, height: 70)
                    .foregroundColor(Color(#colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)))
                    .offset(y: CGFloat(move))
                    .animation(Animation.easeInOut(duration: 1.5).repeatCount(1 ,autoreverses: true).delay(0.5))
                
                Circle() // Seven. 0.6 delay
                    .stroke(lineWidth: 5)
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)))
                    .offset(y: CGFloat(move))
                    .animation(Animation.easeInOut(duration: 1.5).repeatCount(1 ,autoreverses: true).delay(0.6))
                
                Circle() // Eight. 0.7 delay
                    .stroke(lineWidth: 5)
                    .frame(width: 90, height: 90)
                    .foregroundColor(Color(#colorLiteral(red: 0.8446564078, green: 0.5145705342, blue: 1, alpha: 1)))
                    .offset(y: CGFloat(move))
                    .animation(Animation.easeInOut(duration: 1.5).repeatCount(1 ,autoreverses: true).delay(0.7))
                
                Circle() // Nine. 0.8 delay
                    .stroke(lineWidth: 5)
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color(#colorLiteral(red: 0.5738074183, green: 0.5655357838, blue: 0, alpha: 1)))
                    .offset(y: CGFloat(move))
                    .animation(Animation.easeInOut(duration: 1.5).repeatCount(1 ,autoreverses: true).delay(0.8))
                
                Circle() // Ten. 0.9 delay
                    .stroke(lineWidth: 5)
                    .frame(width: 110, height: 110)
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)))
                    .offset(y: CGFloat(move))
                    .animation(Animation.easeInOut(duration: 1.5).repeatCount(1 ,autoreverses: true).delay(0.9))
                    
            }
            .rotation3DEffect(.degrees(25), axis: (x: 1, y: -5, z: 5))
           
            
            
        }
        
    }
}
