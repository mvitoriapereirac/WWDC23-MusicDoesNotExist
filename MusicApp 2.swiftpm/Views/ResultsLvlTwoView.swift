//
//  ResultsLvlTwoView.swift
//  MusicApp
//
//  Created by mvitoriapereirac on 18/04/23.
//

import SwiftUI
struct LvlTwoResults : View {
    let levelKey = "LvlTwo"
    var body: some View {
        ResultsPresentation(levelKey: levelKey, route: .resultLvlThree)
    }
}

