//
//  MusicApp
//
//  Created by mvitoriapereirac on 15/04/23.
//

import SwiftUI
import UIKit
final public class CustomFont {
    
    static let sharedFont = CustomFont()
    
    public func setProjectFont(fontSize: Double) -> Font {
        let fontURL = Bundle.main.url(forResource: "BlinkHead-Fill", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(fontURL! as CFURL, CTFontManagerScope.process, nil)
        let font = UIFont(name: "BlinkHead-Fill", size: fontSize)!
        let swiftUIFont = Font(font)
        return swiftUIFont
    }
    public init() {}
}
