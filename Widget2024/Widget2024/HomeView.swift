//
//  File: HomeView.swift. Package: Widget2024
//  🍋‍🟩 Created by (mac/P.Dev) on 27/4/24.
//  Copyright © 2024 mac. All rights reserved.
//
//  If it can help you, support me by submitting 1 start at github project.
//  name: Purplle-Code
//  Sourch: https://github.com/Purplle-Code/Config-Widget-2024-SwiftUI-


import SwiftUI

struct HomeView: View {
    @EnvironmentObject var sidebarManager: SidebarManager
    
    var body: some View {
        VStack {
            Button {
                sidebarManager.onToggle()
            } label: {
                Text("Home View")
                    .padding()
                    .background(Color.random())
            }
            .allowsHitTesting(true)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
