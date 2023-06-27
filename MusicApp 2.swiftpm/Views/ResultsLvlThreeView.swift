//
//  ResultsLvlThreeView.swift
//  MusicApp
//
//  Created by mvitoriapereirac on 18/04/23.
//

import SwiftUI

struct LvlThreeResults : View {
    let levelKey = "LvlThree"
    
    var body: some View {
        ResultsPresentation(levelKey: levelKey, route: .homePage)
    }
}
