//
//  LevelThree.swift
//  MusicApp
//
//  Created by mvitoriapereirac on 17/04/23.
//

import SwiftUI

struct LevelThree: View {
    let introTitle = "Level 3 -"
    let subTitle = "The Claim"
    let bodySubtitle = "Music does not exist. Do you believe it?"
    let bodyPrompt = "What do you think represents best the act of listening to a song? Hit play and select the best one (tip: try to drag the second animation around)."
    var body: some View {
        LevelsPresentation(introTitle: introTitle, subTitle: subTitle, bodySubtitle: bodySubtitle, bodyPrompt: bodyPrompt, animationOne: ListeningToTheSameSong(), animationTwo: PlayView(), goToPage: .resultLvlOne, whichLvl: "LvlThree")

    }
}
