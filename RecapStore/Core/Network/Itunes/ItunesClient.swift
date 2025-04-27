//
//  ItunesClient.swift
//  RecapStore
//
//  Created by 김도형 on 4/28/25.
//

import Foundation

final actor ItunesClient {
    static let shared = ItunesClient()
    
    private let provider = NetworkProvider<ItunesEndPoint>()
    private init() {}
    
    func lookup(_ model: LookupRequest) async throws -> SearchDetail? {
        let response: Responsable<[SearchDetail]> = try await provider.request(.lookup(model: model))
        return response.results.first
    }
    
    func search(_ model: SearchRequest) async throws -> [SearchResult] {
        let response: Responsable<[SearchResult]> = try await provider.request(.search(model: model))
        return response.results
    }
}
