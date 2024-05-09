//
//  File: Color+EXT.swift. Package: Widget2024
//  🍋‍🟩 Created by (mac/P.Dev) on 28/4/24.
//  Copyright © 2024 mac. All rights reserved.
//
//  If it can help you, support me by submitting 1 start at github project.
//  name: Purplle-Code
//  Sourch: https://github.com/Purplle-Code/Config-Widget-2024-SwiftUI-



import SwiftUI


extension Color {
    struct RGBA: Codable, Hashable, Sendable {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 1
        
        static let `default` = RGBA()
    }
}

extension Color.RGBA {
    static func formatColor(color: Color) -> Color.RGBA {
        let components = color.components
        return Color.RGBA.init(
            red: components.red,
            green: components.green,
            blue: components.blue,
            alpha: components.opacity
        )
    }
    
    func formatColor(color: Color) -> Color.RGBA {
        let components = color.components
        return Color.RGBA.init(
            red: components.red,
            green: components.green,
            blue: components.blue,
            alpha: components.opacity
        )
    }
}



extension ColorScheme {
    func toColorCodeAble() -> ColorCodeAble {
        switch self {
        case .dark:
            ColorCodeAble.dark
        case .light:
            ColorCodeAble.light
            
        @unknown default:
            ColorCodeAble.light
        }
    }
    
    enum ColorCodeAble: String, CaseIterable, Codable {
        case light
        case dark
        case none
        
        func toColorScheme() -> ColorScheme {
            @Environment(\.colorScheme) var colorScheme
            var mode: ColorScheme = .dark
            switch self {
            case .light:
                mode = ColorScheme.light
            case .dark:
                mode = ColorScheme.dark
            case .none:
                mode = colorScheme
            }
            
            return mode
        }
    }
}


extension Color {
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) {
#if canImport(UIKit)
        typealias NativeColor = UIColor
#elseif canImport(AppKit)
        typealias NativeColor = NSColor
#endif
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var o: CGFloat = 0
        
        guard NativeColor(self).getRed(&r, green: &g, blue: &b, alpha: &o) else {
            // You can handle the failure here as you want
            return (0, 0, 0, 0)
        }
        
        return (r, g, b, o)
    }
    
    var toHex: String {
        let components = self.cgColor!.components!
        let r = components[0]
        let g = components[1]
        let b = components[2]
        
        return String(format: "%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
    }
}
