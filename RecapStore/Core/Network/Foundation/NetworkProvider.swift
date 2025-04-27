//
//  NetworkProvider.swift
//  RecapStore
//
//  Created by 김도형 on 4/26/25.
//

import Foundation

import Foundation

enum HTTPSession {
    static func task(_ request: URLRequest) async throws -> (Data, URLResponse) {
        guard let (data, response) = try? await URLSession.shared.data(for: request) else {
            throw URLError(.unknown)
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.unknown)
        }
        
        guard (200...204).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return (data, response)
    }
}

struct NetworkProvider<E: EndPoint> {
    func request<T: Decodable> (
        _ endPoint: E
    ) async throws -> T {
        let request = try endPoint.asURLRequest()
        let (data, _) = try await HTTPSession.task(request)
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        
        return decodedData
    }
}
