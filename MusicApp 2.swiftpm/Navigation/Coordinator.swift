//
//  File.swift
//  
//
//  Created by mvitoriapereirac on 15/04/23.
//

import SwiftUI

class Coordinator: ObservableObject {
    @Published var path: [Route] = []
    
    func goBackOnePage() {
        path.removeLast(1)
    }
    
    func popView(view: Route) {
        for element in path {
            if element == view {
                path.remove(at:(path.firstIndex(of: element) ?? 0))

            }
        }
    }
    func gotoHomePage() {
        path.removeLast(path.count)
    }
    
    func goToHomePage() {
        path.append(Route.homePage)
    }
    
    func goTo(view: Route) {
        path.append(view)
    }
    
    func goToLevelTwoPage() {
        path.append(Route.levelTwo)
    }
    
    func goToCreditsPage() {
        path.append(Route.credits)
    }
}
