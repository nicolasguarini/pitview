//
//  Font.swift
//  PitView
//
//  Created by Nicolas Guarini on 09/03/24.
//

import SwiftUI

extension Font {
    static func f1FontRegular(size: CGFloat) -> Font {
        return Font.custom("Formula1-Display-Regular", size: size)
    }
    
    static func f1FontItalic(size: CGFloat) -> Font {
        return Font.custom("Formula1-Display-Italic", size: size)
    }
    
    static func f1FontBold(size: CGFloat) -> Font {
        return Font.custom("Formula1-Display-Bold", size: size)
    }
    
    static func f1FontBlack(size: CGFloat) -> Font {
        return Font.custom("Formula1-Display-Black", size: size)
    }
    
    static func f1FontWide(size: CGFloat) -> Font {
        return Font.custom("Formula1-Display-Wide", size: size)
    }
}
