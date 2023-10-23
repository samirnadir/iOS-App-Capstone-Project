//
//  Fonts.swift
//  Little Lemon
//
//  Created by Sameer Ghauri on 20/09/2023.
//

import SwiftUI

extension Font {
    
    
    static func DisplayTitle() -> Font {
        return (
            Font.custom("MarkaziText-Medium", size: 62)
        )
    }
    static func SubTitle() -> Font {
        return (
            Font.custom("MarkaziText-Regular", size: 40)
            //.weight(.regular)
        )
    }
    static func LeadText() -> Font {
        return (
            Font.custom("Karla-Medium", size: 18)
            //.weight(.medium)
        )
    }
    
    
    static func SectionTitle() -> Font {
        return (
            Font.custom("Karla-ExtraBold", size: 20)
                .weight(.bold)
        )
    }
    static func SectionCategory() -> Font {
        return (
            Font.custom("Karla-Bold", size: 16)
                .weight(.bold)
        )
    }
    
    static func CardTitle() -> Font {
        return (
            Font.custom("Karla-Bold", size: 18)
                .weight(.bold)
        )
    }
    static func ParagraphText() -> Font {
        return (
            Font.custom("Karla-Regular", size: 16)
                .weight(.regular)
            
        )
    }
    static func HighlightText() -> Font {
        return (
            Font.custom("Karla-ExtraBold", size: 18)
                .weight(.bold)
        )
    }
    
    static func OnboardingText() -> Font {
        return (
            Font.custom("Karla-Bold", size: 20)
                .weight(.bold)
                .bold()
        )
    }
}


