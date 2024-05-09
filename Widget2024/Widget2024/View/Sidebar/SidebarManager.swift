//
//  File: SidebarManager.swift. Package: Widget2024
//  🍋‍🟩 Created by (mac/P.Dev) on 5/5/24.
//  Copyright © 2024 mac. All rights reserved.
//
//  If it can help you, support me by submitting 1 start at github project. 
//  name: Purplle-Code
//  Sourch: https://github.com/Purplle-Code/Config-Widget-2024-SwiftUI-

    

import SwiftUI

class SidebarManager: ObservableObject {
    init(
        width: CGFloat,
        offsetX: CGFloat
    ) {
        self.width = width
        self.offsetX = offsetX
    }
    
    @Published var width: CGFloat = 0
    @Published var offsetX: CGFloat = 0
    @Published var toggle: Bool = true
    
    func onToggle() {
        withAnimation {
            toggle.toggle()
            if toggle {
                offsetX = -width
            } else {
                offsetX = 0
            }
        }
    }
    
}

