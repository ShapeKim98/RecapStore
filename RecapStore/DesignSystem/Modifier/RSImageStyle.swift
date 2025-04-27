//
//  RSImageStyle.swift
//  RecapStore
//
//  Created by 김도형 on 4/27/25.
//

import SwiftUI

private struct RSImageStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(
                cornerRadius: 20,
                style: .continuous
            ))
            .clipped()
            .overlay(.secondary.opacity(0.5), in: RoundedRectangle(
                cornerRadius: 20,
                style: .continuous
            ).stroke(lineWidth: 1))
    }
}

extension View {
    func rsImageStyle() -> some View {
        modifier(RSImageStyle())
    }
}
