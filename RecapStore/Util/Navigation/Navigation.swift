//
//  Navigation.swift
//  RecapStore
//
//  Created by 김도형 on 4/27/25.
//

import SwiftUI

struct Navigation<P: Sendable> {
    var push: (_ path: P) -> Void
    var pop: () -> Void
    var popAll: () -> Void
    var publisher: () -> AsyncStream<Action> = {
        return AsyncStream { $0.finish() }
    }
}

extension Navigation {
    enum Action {
        case push(path: P)
        case pop
        case popAll
    }
}

extension Navigation: EnvironmentKey {
    static var defaultValue: Navigation {
        var pathContinuation: AsyncStream<Action>.Continuation?
        
        return Self(
            push: { path in
                pathContinuation?.yield(.push(path: path))
            },
            pop: {
                pathContinuation?.yield(.pop)
            },
            popAll: {
                pathContinuation?.yield(.popAll)
            },
            publisher: {
                AsyncStream { continuation in
                    pathContinuation = continuation
                }
            }
        )
    }
}
