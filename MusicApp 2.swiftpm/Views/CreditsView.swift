//
//  File.swift
//  
//
//  Created by mvitoriapereirac on 19/04/23.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        
        VStack(spacing: 50){
            Text("Credits")
                .font(CustomFont.sharedFont.setProjectFont(fontSize: 50.0))
                .foregroundColor(.accentColor)
                .frame(alignment: .center)
            HStack(spacing: 20) {
                VStack(alignment: .trailing) {
                    Text("Sociological theory")
                        .foregroundColor(.whitePrimary)
                        .fontSize(20)

                    Text("Animations inspiration")
                        .foregroundColor(.whitePrimary)
                        .fontSize(20)


                    Text("")
                        .fontSize(20)

                    Text("Soundtrack")
                        .foregroundColor(.whitePrimary)
                        .fontSize(20)


                    
                }
                VStack(alignment: .leading) {
                    Text("Antoine Hennion")
                        .foregroundColor(.whitePrimary)
                        .fontSize(20)


                    Text("https://www.instagram.com/inncoder/")
                        .foregroundColor(.whitePrimary)
                        .fontSize(20)


                    Text("https://github.com/amosgyamfi/open-swiftui-animations")                    .foregroundColor(.whitePrimary)
                        .fontSize(20)


                    Text("Lucas Migge (https://www.instagram.com/miggelucas/)")                    .foregroundColor(.whitePrimary)
                        .fontSize(20)




                    
                }
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.darkBackground)
        
        
    }
}
