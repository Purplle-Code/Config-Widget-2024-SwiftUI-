//
//  File: Theme.swift. Package: Widget2024
//  🍋‍🟩 Created by (mac/P.Dev) on 28/4/24.
//  Copyright © 2024 mac. All rights reserved.
//
//  If it can help you, support me by submitting 1 start at github project. 
//  name: Purplle-Code
//  Sourch: https://github.com/Purplle-Code/Config-Widget-2024-SwiftUI-

    

import SwiftUI

@MainActor
public final class Theme: ObservableObject {
    public static let shared = Theme()
    let themeStorage = ThemeStorage()
    
    private var _cachedChoosenFont: UIFont?
    
    
    final class ThemeStorage {
        enum ThemeKey: String {
          case colorScheme, tint, label, primaryBackground, secondaryBackground
          case selectedSet, selectedScheme
          case followSystemColorSchme
          case lineSpacing
          case chosenFont
        }
        
        var tintColor: Color.RGBA {
            get { return (try? JSONDecoder().decode(Color.RGBA.self, from: self._tintColor)) ?? .default }
            set {  _tintColor = (try? JSONEncoder().encode(newValue)) ?? Data() }
        }
        
        var selectedScheme: ColorScheme {
            get { return _selectedScheme.toColorScheme() }
            set {  _selectedScheme = newValue.toColorCodeAble() }
        }
        
        var labelColor: Color.RGBA {
            get { return (try? JSONDecoder().decode(Color.RGBA.self, from: self._tintColor)) ?? .default }
            set {  _labelColor = (try? JSONEncoder().encode(newValue)) ?? Data() }
        }
        
        var chosenFont: UIFont {
            get {
                if let _chosenFontData {
                    let font = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIFont.self, from: _chosenFontData)
                }
                
                return UIFont.systemFont(ofSize: Font.bodySize)
            }
            set {
                
            }
        }
        
        @AppStorage(ThemeKey.tint.rawValue) private var _tintColor: Data = Data()
        @AppStorage(ThemeKey.selectedScheme.rawValue) private var _selectedScheme: ColorScheme.ColorCodeAble = .dark
        @AppStorage(ThemeKey.label.rawValue) private var _labelColor: Data = Data()
        @AppStorage(ThemeKey.chosenFont.rawValue) private var _chosenFontData: Data?
        
        init() {}
    }
}

