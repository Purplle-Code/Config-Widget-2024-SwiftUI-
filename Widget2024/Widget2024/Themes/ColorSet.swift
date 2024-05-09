//
//  File: ColorSet.swift. Package: Widget2024
//  🍋‍🟩 Created by (mac/P.Dev) on 29/4/24.
//  Copyright © 2024 mac. All rights reserved.
//
//  If it can help you, support me by submitting 1 start at github project.
//  name: Purplle-Code
//  Sourch: https://github.com/Purplle-Code/Config-Widget-2024-SwiftUI-



import SwiftUI

public enum ColorSetName: String {
    case mediumLight = "mediumLight"
    case mediumDark  = "mediumDark"
}


public protocol ColorSet {
    var name: ColorSetName { get }
    var scheme: ColorScheme { get }
    var tintColor: Color { get set }
    var primaryBackgroundColor: Color { get set }
    var secondaryBackgroundColor: Color { get set }
    
    var labelColor: Color { get set }
    var textColor: Color { get set }
    var subTextColor: Color { get set }
}

public struct MediumLight: ColorSet {
    public var name: ColorSetName = .mediumLight
    public var scheme: ColorScheme = .light
    public var tintColor: Color = .init(red: 187 / 255, green: 59 / 255, blue: 226 / 255)
    public var primaryBackgroundColor: Color = .white
    public var secondaryBackgroundColor: Color = .init(hex: 0xF0F1F2)
    
    public var labelColor: Color = .black
    public var textColor: Color = .black
    public var subTextColor: Color = .init(hex: 0x666666, opacity: 1)
    
    public init() {}
}

public struct MediumDark: ColorSet {
    public var name: ColorSetName = .mediumDark
    public var scheme: ColorScheme = .dark
    public var tintColor: Color = .init(red: 187 / 255, green: 59 / 255, blue: 226 / 255)
    public var primaryBackgroundColor: Color = .init(red: 16 / 255, green: 21 / 255, blue: 35 / 255)
    public var secondaryBackgroundColor: Color = .init(red: 30 / 255, green: 35 / 255, blue: 62 / 255)
    
    public var labelColor: Color = .white
    public var textColor: Color = .white
    public var subTextColor: Color = .init(hex: 0xCCCCCC, opacity: 1)
    
    public init() {}
}
