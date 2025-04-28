//
//  ZoomTransition.swift
//  RecapStore
//
//  Created by 김도형 on 4/28/25.
//

import SwiftUI

private struct ZoomTransition<ID: Hashable>: ViewModifier {
    private let sourceID: ID
    private let namespace: Namespace.ID
    
    init(sourceID: ID, in namespace: Namespace.ID) {
        self.sourceID = sourceID
        self.namespace = namespace
    }
    
    func body(content: Content) -> some View {
        if #available(iOS 18.0, *) {
            content
                .navigationTransition(.zoom(
                    sourceID: sourceID,
                    in: namespace
                ))
        } else {
            content
        }
    }
}

private struct TransitionSource<ID: Hashable>: ViewModifier {
    private let sourceID: ID
    private let namespace: Namespace.ID
    
    init(sourceID: ID, in namespace: Namespace.ID) {
        self.sourceID = sourceID
        self.namespace = namespace
    }
    
    func body(content: Content) -> some View {
        if #available(iOS 18.0, *) {
            content
                .matchedTransitionSource(
                    id: sourceID,
                    in: namespace
                )
        } else {
            content
        }
    }
}

extension View {
    func zoomTransition(
        sourceID: some Hashable,
        in namespace: Namespace.ID
    ) -> some View {
        modifier(ZoomTransition(sourceID: sourceID, in: namespace))
    }
    
    func transitionSource(
        sourceID: some Hashable,
        in namespace: Namespace.ID
    ) -> some View {
        modifier(TransitionSource(sourceID: sourceID, in: namespace))
    }
}
