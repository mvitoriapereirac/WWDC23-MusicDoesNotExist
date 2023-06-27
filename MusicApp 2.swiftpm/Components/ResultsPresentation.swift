//
//  ResultLvlOneVIew.swift
//  MusicApp
//
//  Created by mvitoriapereirac on 18/04/23.
//

import SwiftUI

struct ResultsPresentation: View {
    @EnvironmentObject var coordinator: Coordinator
    
    let projectFont = CustomFont()
    let textModels = TextModels()
    let levelKey: String
    let route: Route
    @State var chosenAnimationText = ""
    @State var levelText = ""
    @State var showFirstPart = false
    @State var showSecondPart = false
    
    var body: some View {
        
        VStack(spacing: 50) {
            Text("\(levelKey) - Your choice was...")
                .font(projectFont.setProjectFont(fontSize: 30))
                .foregroundColor(Color.redPrimary)
                .fontSize(30)
                .frame(alignment: Alignment.topLeading)
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            showFirstPart = true
                        }
                    })
                }
            if showFirstPart {
                HStack(spacing: 20){
                    
                    
                    
                    
                    if  UserDefaults.standard.integer(forKey: levelKey) == 1 {
                        if levelKey == "LvlOne" {
                            TwoSeparatePeopleAnimation()
                                .onAppear{
                                    chosenAnimationText = textModels.lvlOneFirst
                                    levelText = textModels.lvlOne
                                    
                                }
                        } else if levelKey == "LvlTwo" {
                            shapeFitsInTheVoid()
                                .onAppear{
                                    chosenAnimationText = textModels.lvlTwoFirst
                                    levelText = textModels.lvlTwo
                                    
                                }
                        } else if levelKey == "LvlThree" {
                            ListeningToTheSameSong()
                                .onAppear{
                                    chosenAnimationText = textModels.lvlThreeFirst
                                    levelText = textModels.lvlThree
                                    
                                }
                        }
                        
                    } else if UserDefaults.standard.integer(forKey: levelKey) == 2 {
                        if levelKey == "LvlOne" {
                            TwoPeopleInANetAnimation()
                                .onAppear{
                                    chosenAnimationText = textModels.lvlOneSecond
                                    levelText = textModels.lvlOne
                                    
                                    
                                }
                        } else if levelKey == "LvlTwo" {
                            VoidTransformsToFitShape()
                                .onAppear{
                                    chosenAnimationText = textModels.LvlTwoSecond
                                    levelText = textModels.lvlTwo
                                    
                                    
                                }
                        } else if levelKey == "LvlThree" {
                            PlayView()
                                .frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.height / 4)
                                .onAppear{
                                    chosenAnimationText = textModels.lvlThreeSecond
                                    levelText = textModels.lvlThree
                                    
                                }
                        }
                        
                    }
                    
                    
                    
                    Text(chosenAnimationText)
                        .foregroundColor(Color.whitePrimary)
                        .fontSize(25.0)
                        .multilineTextAlignment(.center)
                        .padding(.all, 20)
                    
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4.0, execute: {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            showSecondPart = true
                        }
                    })
                }
            }
            
            
            if showSecondPart {
                
                
                if levelKey == "LvlOne" {
                    NetAnimation()
                        .rotate(.degrees(90.0))
//                        .onAppear{
//                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4.0, execute: {
//                                withAnimation(.easeInOut(duration: 2.0)) {
//                                }
//                            })
//                        }
                        .frame(width: 100, height: 50)
                    
                }
                
                Text(levelText)
                    .foregroundColor(Color.whitePrimary)
                    .fontSize(25.0)
                    .multilineTextAlignment(.center)
                    .padding(.all, 20)
//                    .onAppear{
//                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4.0, execute: {
//                            withAnimation(.easeInOut(duration: 2.0)) {
//                            }
//                        })
//                    }
                
                Button("Next") {
                    if route != .homePage {
                        coordinator.goTo(view: route)
                    } else {
                        coordinator.gotoHomePage()
                    }
                    
                }
                .frame(alignment: .bottomTrailing)
                .font(.system(size: 25, weight: Font.Weight.medium))
                .foregroundColor(Color.darkBackground)
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.redPrimary).opacity(0.8))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.all, 20)
        .background(Color.darkBackground)
        
    }
}
