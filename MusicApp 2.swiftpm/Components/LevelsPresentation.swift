//
//  LevelOne.swift
//  MusicApp
//
//  Created by mvitoriapereirac on 15/04/23.
//

import SwiftUI

struct LevelsPresentation<AnimationOneView, AnimationTwoView> : View where AnimationOneView : View, AnimationTwoView : View {
    
    @State private var presentTitle = true
    @State private var loadPageBody = false
    @State private var loadBody = false
    @State private var loadAnimations = false
    @State private var isButtonHidden = true
    @State private var isButton1Selected = false
    @State private var isButton2Selected = false
    @EnvironmentObject var coordinator: Coordinator
    
    let introTitle: String
    let subTitle: String
    let bodySubtitle: String
    let bodyPrompt: String
    let animationOne: AnimationOneView
    let animationTwo: AnimationTwoView
    let goToPage: Route
    let whichLvl: String
    

    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            if presentTitle {
                LevelsIntro(title: introTitle, subTitle: subTitle)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4.5, execute: {
                            withAnimation(.easeIn(duration: 3.0)) {
                                presentTitle.toggle()
                                loadBody.toggle()
                            }
                        })
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            if loadBody {
                
                Text(bodySubtitle)
                    .font(CustomFont.sharedFont.setProjectFont(fontSize: 35))
                    .padding(.horizontal, 20)
                    .foregroundColor(Color.redPrimary)
                    .shadow(color: .redPrimary, radius: 4.5)

                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                loadPageBody.toggle()
                            }
                        })
                        
                    }
                if loadPageBody {
                    VStack() {
                        Text(bodyPrompt)
                            .fontSize(30.0)
                            .padding(.all, 20)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.whitePrimary)
                            .onAppear{
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                                    withAnimation(.easeInOut(duration: 1.0)) {
                                        loadAnimations = true
                                    }
                                })
                                
                            }
                        VStack(spacing: 10){
                            
                            if loadAnimations{
                                ZStack{
                                    Button(action: {
                                        isButtonHidden = false

                                        self.isButton1Selected.toggle()
                                        if self.isButton1Selected {
                                            self.isButton2Selected = false
                                        }
                                    }) {
                                        
                                        if isButton1Selected {
                                            RoundedRectangle(cornerSize: CGSize(10))
                                                .stroke(lineWidth: 4)
                                                .frame(width: UIScreen.main.bounds.width * 0.95, height: 300)
                                                .padding()
                                                .foregroundColor(.cgLightGray)
                                                .opacity(0.5)
                                        } else {
                                            RoundedRectangle(cornerSize: CGSize(10))
                                                .stroke(lineWidth: 1)
                                                .foregroundColor(.cgLightGray)
                                                .frame(width: UIScreen.main.bounds.width * 0.95, height: 300)
                                                .padding()
                                                .foregroundColor(.clear)
                                                .opacity(0.5)

                                            
                                        }
                                            
                                    }
                                    .frame(width: UIScreen.main.bounds.width, height: 300)

                                    
                                    
                                    animationOne
                                        .frame(width: 300, height: 300)
                                        .onAppear{
                                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
                                                withAnimation(.easeInOut(duration: 0.3)) {
                                                }
                                            })
                                            
                                        }
                                }

                                
                            
                            
                                
                                ZStack {
                                    
                                    Button(action: {
                                        isButtonHidden = false

                                        self.isButton2Selected.toggle()
                                        if self.isButton2Selected {
                                            self.isButton1Selected = false
                                        }
                                    }) {
                                        if isButton2Selected {

                                            RoundedRectangle(cornerSize: CGSize(10))
                                                .stroke(lineWidth: 4)
                                                .frame(width: UIScreen.main.bounds.width * 0.95, height: 300)
                                                .padding()
                                                .foregroundColor(.cgLightGray)
                                                .opacity(0.5)

                                        } else {
                                            RoundedRectangle(cornerSize: CGSize(10))
                                                .stroke(lineWidth: 1)
                                                .foregroundColor(.cgLightGray)
                                                .frame(width: UIScreen.main.bounds.width * 0.95, height: 300)
                                                .padding()
                                                .foregroundColor(.clear)
                                                .opacity(0.5)

                                            
                                        }

                                    }
                                    .frame(width: UIScreen.main.bounds.width, height: 300)



                                    
                                    animationTwo
                                        .frame(width: 300, height: 300, alignment: .center)
                                        .onAppear{
                                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                                                withAnimation(.easeInOut(duration: 0.3)) {
                                                }
                                            })
                                            
                                        }
                                }
                                
                            }
                        }

                        
                        
                        if isButtonHidden {
                            Button("Continue") {
                                
                                
                            }
                            .hidden()

                            .frame(alignment: .bottomTrailing)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 10)
                            
                        } else {
                            Button("Continue") {
                                if isButton1Selected {
                                    UserDefaults.standard.set(1, forKey: whichLvl)
                                    coordinator.goTo(view: goToPage)

                                } else if isButton2Selected {
                                    UserDefaults.standard.set(2, forKey: whichLvl)  
                                    coordinator.goTo(view: goToPage)

                                }
                                else {
                                    
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

                    
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.darkBackground)
        
        
        
//
    }
}
