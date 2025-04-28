//
//  NetworkMonitor.swift
//  CoinCo
//
//  Created by 김도형 on 3/11/25.
//

import Foundation
import Network
@preconcurrency
import Combine

final actor NetworkMonitor {
    static let shared = NetworkMonitor()
    
    private let monitor = NWPathMonitor()
    private let subject = PassthroughSubject<NWPath, Never>()
    
    private init() {
        Task { [weak self] in
            await self?.monitoringStart()
        }
    }
    
    deinit { monitor.cancel() }
    
    var publisher: AsyncStream<NWPath> {
        let values = subject.eraseToAnyPublisher().values
        return AsyncStream { continuation in
            Task { @Sendable in
                for await path in values {
                    continuation.yield(path)
                }
            }
        }
        
    }
    
    func monitoringStart() async {
        monitor.start(queue: DispatchQueue.global(qos: .background))
        monitor.pathUpdateHandler = self.updateHandler
    }
    
    private func updateHandler(_ path: NWPath) {
        subject.send(path)
    }
}
