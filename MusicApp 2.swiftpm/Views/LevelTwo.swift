//
//  LevelTwo.swift
//  MusicApp
//
//  Created by mvitoriapereirac on 16/04/23.
//

import SwiftUI

struct LevelTwo: View {
    @EnvironmentObject var coordinator: Coordinator
    let introTitle = "Level 2 -"
    let subTitle = "Taste as an object of investigation"
    let bodySubtitle = "Were you always the way you are now?"
    let bodyPrompt = "Now we think about taste. Which interaction represents best the proccess of liking or disliking something? Interact with the animations and choose your favorite."
    var levelOneSelection = 0
    var body: some View {
        LevelsPresentation(introTitle: introTitle, subTitle: subTitle, bodySubtitle: bodySubtitle, bodyPrompt: bodyPrompt, animationOne: shapeFitsInTheVoid(), animationTwo: VoidTransformsToFitShape(), goToPage: Route.levelThree, whichLvl: "LvlTwo")
        
    }
}
