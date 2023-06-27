//
//  LevelOne.swift
//  MusicApp
//
//  Created by mvitoriapereirac on 16/04/23.
//

import Foundation
import SwiftUI


struct LevelOne: View {
    let introTitle = "Level 1 - "
    let introSubtitle = "The Amateur"
    let bodySubtitle = "Where do you end and where do I begin?"
    let bodyPrompt = "If you were asked, “how can an encounter between two people be best represented?”, what would you choose? Select between the animations."
    var body: some View {
        LevelsPresentation(introTitle: introTitle, subTitle: introSubtitle, bodySubtitle: bodySubtitle, bodyPrompt: bodyPrompt, animationOne: TwoSeparatePeopleAnimation(), animationTwo: TwoPeopleInANetAnimation(), goToPage: Route.levelTwo, whichLvl: "LvlOne")
    }
}
