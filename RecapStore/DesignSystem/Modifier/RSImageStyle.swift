//
//  RSImageStyle.swift
//  RecapStore
//
//  Created by 김도형 on 4/27/25.
//

import SwiftUI

private struct RSImageStyle: ViewModifier {
    private let radius: CGFloat
    
    init(radius: CGFloat) {
        self.radius = radius
    }
    
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(
                cornerRadius: radius,
                style: .continuous
            ))
            .clipped()
            .overlay(.secondary.opacity(0.2), in: RoundedRectangle(
                cornerRadius: radius,
                style: .continuous
            ).stroke(lineWidth: 1))
    }
}

extension View {
    func rsImageStyle(radius: CGFloat = 12) -> some View {
        modifier(RSImageStyle(radius: radius))
    }
}
