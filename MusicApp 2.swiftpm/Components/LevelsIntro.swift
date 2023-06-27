//
//  LevelsIntro.swift
//  MusicApp
//
//  Created by mvitoriapereirac on 15/04/23.
//

import SwiftUI

struct LevelsIntro: View {
    
    @State var showSubtitle = false
    let projectFont = CustomFont()
    let title: String
    let subTitle: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(projectFont.setProjectFont(fontSize: 50))
                .padding(.all, 30)
                .frame(alignment: Alignment.leading)
                .foregroundColor(Color.white)
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0, execute: {
                        withAnimation(.easeInOut(duration: 2.0)) {
                            showSubtitle = true
                        }
                    })
                }
            
            if showSubtitle {
                Text(subTitle)
                    .font(projectFont.setProjectFont(fontSize: 50))
                    .padding(.all, 30)
                    .foregroundColor(Color.darkBackground)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5, execute: {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                
                            }
                        })
                    }
                
                
                
                HStack(alignment: .center){
                    Image("head")
                        .resizable()
                        .padding()
                        .frame(400)
                        .shadow(radius: 1.5)
                }
            }
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.redPrimary)

    }

}

