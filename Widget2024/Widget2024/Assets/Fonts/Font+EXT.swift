//
//  File: Font+EXT.swift. Package: Widget2024
//  🍋‍🟩 Created by (mac/P.Dev) on 28/4/24.
//  Copyright © 2024 mac. All rights reserved.
//
//  If it can help you, support me by submitting 1 start at github project.
//  name: Purplle-Code
//  Sourch: https://github.com/Purplle-Code/Config-Widget-2024-SwiftUI-



import SwiftUI

extension Text {
    @MainActor func scaledTitle() -> Text {
        self
            .font(.bold(size: Font.titleSize, relativeTo: .title))
        
        
    }
}

extension Font {
    static func getFamilyNames() {
        let fonts = UIFont.familyNames
        for font in fonts {
            print("[\(#function)][FONT] \(font)")
        }
    }
}

extension Font {
    static let `default`: UIFont = .init(name: "\(Font.fontNamed)-Medium", size: Font.bodySize) ?? .systemFont(ofSize: Font.bodySize)
    static let  fontNamed: String = "NotoSans"
    
    static let titleSize = 20.0
    
    static let headlineSize = 20.0
    static let bodySize  = 19.0
    static let calloutSize  = 17.0
    static let subheadlineSize  = 16.0
    static let footnoteSize  = 15.0
    static let captionSize  = 14.0
    
    @MainActor
    static func fontDisplay(
        namePlus: String,
        size: CGFloat,
        relativeTo textStyle: TextStyle
    ) -> Font {
        let chosenFont = Theme.shared.themeStorage.chosenFont
        if chosenFont.fontName == "NotoSans\(namePlus)" {
            return .system(size: size, design: .rounded)
        } else {
            return .custom(chosenFont.fontName, size: size, relativeTo: textStyle)
        }
    }

//    @MainActor static func heavy(size: CGFloat, relativeTo textStyle: TextStyle = .body) -> Font {
//        return Font.fontDisplay(namePlus: "heavy", size: size, relativeTo: textStyle)
//    }
    
    @MainActor static func bold(
        size: CGFloat = Font.bodySize, 
        relativeTo textStyle: TextStyle = .body
    ) -> Font {
        return Font.fontDisplay(namePlus: "-Bold", size: size, relativeTo: textStyle)
    }
    
    @MainActor static func medium(
        size: CGFloat = Font.bodySize, 
        relativeTo textStyle: TextStyle = .body
    ) -> Font {
        return Font.fontDisplay(namePlus: "-Medium", size: size, relativeTo: textStyle)
    }
    
    @MainActor static func light(
        size: CGFloat = Font.bodySize,
        relativeTo textStyle: TextStyle = .body
    ) -> Font {
        return Font.fontDisplay(namePlus: "-Light", size: size, relativeTo: textStyle)
    }
    
    @MainActor static func regular(
        size: CGFloat = Font.bodySize,
        relativeTo textStyle: TextStyle = .body
    ) -> Font {
        return Font.fontDisplay(namePlus: "-Regular", size: size, relativeTo: textStyle)
    }
    
    @MainActor static func thin(
        size: CGFloat = Font.bodySize,
        relativeTo textStyle: TextStyle = .body
    ) -> Font {
        return Font.fontDisplay(namePlus: "-Thin", size: size, relativeTo: textStyle)
    }
}
