//
//  ToastRouter.swift
//  RecapStore
//
//  Created by 김도형 on 4/28/25.
//

import Foundation

@MainActor
final class ToastRouter {
    static let shared = ToastRouter()
    
    private init() {}
    
    private var contiunation: AsyncStream<String?>.Continuation?
    
    var publisher: AsyncStream<String?> {
        return AsyncStream { [weak self] continuation in
            self?.contiunation = continuation
        }
    }
    
    func presentToast(_ message: String) async {
        self.contiunation?.yield(message)
        try? await Task.sleep(for: .seconds(3))
        self.contiunation?.yield(nil)
    }
    
    func dismissToast() {
        self.contiunation?.yield(nil)
    }
}
