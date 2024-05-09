//
//  File: SidebarView.swift. Package: Widget2024
//  🍋‍🟩 Created by (mac/P.Dev) on 5/5/24.
//  Copyright © 2024 mac. All rights reserved.
//
//  If it can help you, support me by submitting 1 start at github project. 
//  name: Purplle-Code
//  Sourch: https://github.com/Purplle-Code/Config-Widget-2024-SwiftUI-

    

import SwiftUI

struct SidebarView: View {
    @EnvironmentObject var sidebarManager: SidebarManager

    var body: some View {
        VStack {
            Button {
                sidebarManager.onToggle()
            } label: {
                Text("Offset")
            }

        }
        .frame(width: sidebarManager.width)
        .frame(maxHeight: .infinity)
        .background(Color.red)
        
    }
}
