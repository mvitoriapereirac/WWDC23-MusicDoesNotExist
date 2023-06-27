//
//  LvlOneResultsView.swift
//  MusicApp
//
//  Created by mvitoriapereirac on 18/04/23.
//

import SwiftUI
struct LvlOneResults : View {
    let levelKey = "LvlOne"
    var body: some View {
        ResultsPresentation(levelKey: levelKey, route: .resultLvlTwo)
    }
}
