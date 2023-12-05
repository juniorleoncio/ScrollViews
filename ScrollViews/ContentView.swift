//
//  ContentView.swift
//  ScrollViews
//
//  Created by leoncio junior on 05/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(MockData.items) { item in
                    Circle()
                        .containerRelativeFrame(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/, count: verticalSizeClass == .regular ? 2 : 4, spacing: 16.0)
                        .foregroundStyle(item.color.gradient)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.0)
                                .scaleEffect(x: phase.isIdentity ? 1.0 : 0.2,
                                             y: phase.isIdentity ? 1.0 : 0.2)
                                .offset(y: phase.isIdentity ? 0 : 50)
                        }
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(16, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    ContentView()
}


struct Item: Identifiable {
    let id = UUID()
    let color: Color
}

struct MockData {
    static var items = [Item(color: .teal),
                        Item(color: .pink),
                        Item(color: .indigo),
                        Item(color: .orange),
                        Item(color: .purple),
                        Item(color: .yellow),
                        Item(color: .green),
                        Item(color: .blue),
                        Item(color: .brown),
                        Item(color: .red),]
}
