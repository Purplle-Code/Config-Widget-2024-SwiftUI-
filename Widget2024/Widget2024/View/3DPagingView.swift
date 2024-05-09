//
//  File: Combine+EXT.swift. Package: Widget2024
//  🍋‍🟩 Created by (mac/P.Dev) on 28/4/24.
//  Copyright © 2024 mac. All rights reserved.
//
//  If it can help you, support me by submitting 1 start at github project.
//  name: Purplle-Code
//  Sourch: https://github.com/Purplle-Code/Config-Widget-2024-SwiftUI-

import SwiftUI

@available(iOS 17, *)
struct ThreeDPagingView: View {
    @State private var colors: [Color] = [.blue, .green, .orange, .red, .gray, .pink, .yellow]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .center, spacing: 2) {
                ForEach(colors, id: \.self) { color in
                    Rectangle()
                        .foregroundColor(color)
                        .frame(width: 200, height: 200)
                        .cornerRadius(12)
                        .scrollTransition(
                            topLeading: .interactive,
                            bottomTrailing: .interactive,
                            axis: .horizontal
                        ) {
                            effect,
                            shape in
                            
                            effect
                                .scaleEffect(1 - abs(shape.value) > 1 ? 1 : 1 - abs(shape.value) < 0.65 ? 0.65 : 1 - abs(shape.value))
                                .opacity(1 - abs(shape.value) > 1 ? 1 : 1 - abs(shape.value) < 0.65 ? 0.65 : 1 - abs(shape.value))
                                .rotation3DEffect(
                                    .degrees(shape.value),
                                    axis: (
                                        x: 0,
                                        y: 1,
                                        z: 0
                                    ),
                                    anchor: .center
                                )
                        }
                }
            }
            .scrollTargetLayout()
        }
        .scrollClipDisabled()
        .scrollTargetBehavior(.viewAligned)
        .padding(.top)
        
    }
}

extension Color {
    static func random() -> Color {
        return Color.init(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}
