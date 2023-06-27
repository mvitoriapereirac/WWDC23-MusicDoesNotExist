//
//  File.swift
//  
//
//  Created by mvitoriapereirac on 15/04/23.
//

import SwiftUI
import Charts
import NavigationTransitions

struct AppNavigation: View {
    @ObservedObject var coordinator = Coordinator()
    

    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack(path: $coordinator.path){
                selectScreen
            }
            .environmentObject(coordinator)
            .navigationTransition(.fade(.cross))}
        else {
            // Fallback on earlier versions
        }
        
    }
    
    @available(iOS 16.0, *)
    private var selectScreen: some View {
        HomeView()
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .homePage:
                    HomeView().navigationBarBackButtonHidden(true)
                case .levelOne:
                    LevelOne().navigationBarBackButtonHidden(true)
                case .levelTwo:
                    LevelTwo().navigationBarBackButtonHidden(true)
                case .levelThree:
                    LevelThree().navigationBarBackButtonHidden(true)
                case .resultLvlOne:
                    LvlOneResults().navigationBarBackButtonHidden(true)
                case .resultLvlTwo:
                    LvlTwoResults().navigationBarBackButtonHidden(true)
                case .resultLvlThree:
                    LvlThreeResults().navigationBarBackButtonHidden(true)
                case .credits:
                    CreditsView().navigationBarBackButtonHidden(false)

                }
                
            }
    }
}
