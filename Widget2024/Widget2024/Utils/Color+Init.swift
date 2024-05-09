//
//  File: Color+Init.swift. Package: Widget2024
//  🍋‍🟩 Created by (mac/P.Dev) on 28/4/24.
//  Copyright © 2024 mac. All rights reserved.
//
//  If it can help you, support me by submitting 1 start at github project. 
//  name: Purplle-Code
//  Sourch: https://github.com/Purplle-Code/Config-Widget-2024-SwiftUI-

    

import SwiftUI

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
      let red = Double((hex & 0xFF0000) >> 16) / 255.0
      let green = Double((hex & 0xFF00) >> 8) / 255.0
      let blue = Double((hex & 0xFF) >> 0) / 255.0
      self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
    
    init(hex string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }
        
        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }
        
        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }
        
        // Scanner creation
        let scanner = Scanner(string: string)
        
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        
        if string.count == 2 {
            let mask = 0xFF
            
            let g = Int(color) & mask
            
            let gray = Double(g) / 255.0
            
            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)
            
        } else if string.count == 4 {
            let mask = 0x00FF
            
            let g = Int(color >> 8) & mask
            let a = Int(color) & mask
            
            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0
            
            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)
            
        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask
            
            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)
            
        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask
            
            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0
            
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
            
        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
    func hexValue() -> String {
        guard let values = self.cgColor?.components else {return "000000"}
        var outputR: Int = 0
        var outputG: Int = 0
        var outputB: Int = 0
        var outputA: Int = 1
        
        switch values.count {
        case 1:
            outputR = Int(values[0] * 255)
            outputG = Int(values[0] * 255)
            outputB = Int(values[0] * 255)
            outputA = 1
        case 2:
            outputR = Int(values[0] * 255)
            outputG = Int(values[0] * 255)
            outputB = Int(values[0] * 255)
            outputA = Int(values[1] * 255)
        case 3:
            outputR = Int(values[0] * 255)
            outputG = Int(values[1] * 255)
            outputB = Int(values[2] * 255)
            outputA = 1
        case 4:
            outputR = Int(values[0] * 255)
            outputG = Int(values[1] * 255)
            outputB = Int(values[2] * 255)
            outputA = Int(values[3] * 255)
        default:
            break
        }
        return String(format:"%02X", outputR) + String(format:"%02X", outputG) + String(format:"%02X", outputB) + String(format:"%02X", outputA)
    }
    
    init(_ unspecifiedColor: UIColor,
         dark darkColor: UIColor,
         light lightColor: UIColor? = nil) {
        self = Color(UIColor {
            switch $0.userInterfaceStyle {
            case .unspecified:
                return unspecifiedColor
            case .dark:
                return darkColor
            case .light:
                return lightColor ?? unspecifiedColor
            @unknown default:
                return unspecifiedColor
            }
        })
    }
}

extension UIColor {
    convenience init(hex string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }
        
        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }
        
        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }
        
        // Scanner creation
        let scanner = Scanner(string: string)
        
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        
        if string.count == 2 {
            let mask = 0xFF
            
            let g = Int(color) & mask
            
            let gray = CGFloat(g) / 255.0
            
            self.init(red: gray, green: gray, blue: gray, alpha: 1)
            
        } else if string.count == 4 {
            let mask = 0x00FF
            
            let g = Int(color >> 8) & mask
            let a = Int(color) & mask
            
            let gray = CGFloat(g) / 255.0
            let alpha = CGFloat(a) / 255.0
            
            self.init(red: gray, green: gray, blue: gray, alpha: alpha)
            
        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask
            
            let red = CGFloat(r) / 255.0
            let green = CGFloat(g) / 255.0
            let blue = CGFloat(b) / 255.0
            
            self.init(red: red, green: green, blue: blue, alpha: 1)
            
        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask
            
            let red = CGFloat(r) / 255.0
            let green = CGFloat(g) / 255.0
            let blue = CGFloat(b) / 255.0
            let alpha = CGFloat(a) / 255.0
            
            self.init(red: red, green: green, blue: blue, alpha: alpha)
            
        } else {
            self.init(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    convenience init(hexUIColor: String) {
        var sanitizedHex = hexUIColor.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        if sanitizedHex.count == 6 {
            sanitizedHex = "FF" + sanitizedHex
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: sanitizedHex).scanHexInt64(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat((rgbValue & 0xFF000000) >> 24) / 255.0
        )
    }
    
    
}
