//
//  File: Combine+EXT.swift. Package: Widget2024
//  🍋‍🟩 Created by (mac/P.Dev) on 28/4/24.
//  Copyright © 2024 mac. All rights reserved.
//
//  If it can help you, support me by submitting 1 start at github project.
//  name: Purplle-Code
//  Sourch: https://github.com/Purplle-Code/Config-Widget-2024-SwiftUI-

import SwiftUI

@available(iOS 17.0, *)
struct ContentView: View {
    @EnvironmentObject var router: Router
    @GestureState private var isDragingGesture = false
    
    @StateObject private var sidebarManager: SidebarManager = .init(
        width: 140,
        offsetX: 0
    )
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            Color.yellow
            
            HStack(spacing: 0) {
                SidebarView()
                
                VStack(spacing: 0) {
                    NavigationStack(path: $router.path) {
                        HomeView()
                    }
                    .background(Color.clear)
                    .navigationViewStyle(.stack)
                    .scrollContentBackground(.hidden)
                }
                .scaleEffect(sidebarManager.toggle ? 0.95 : 1, anchor: .trailing)
                .rotation3DEffect(.degrees(
                    sidebarManager.toggle ? 12 : 0
                ), axis: (x: 0, y: -1, z: 0))
            }
            .frame(width: size.width + sidebarManager.width, height: size.height)
            .offset(x: sidebarManager.toggle ? 0 : -sidebarManager.width)
            .contentShape(.rect)
        }
        .ignoresSafeArea()
        .environmentObject(sidebarManager)
        
    }
}
