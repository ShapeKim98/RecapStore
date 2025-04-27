//
//  ParameterEncoder.swift
//  RecapStore
//
//  Created by 김도형 on 4/26/25.
//

import Foundation

protocol ParameterEncoder {
    func encode(
        request: inout URLRequest,
        with parameters: Parameters?
    ) throws
}

extension ParameterEncoder where Self == URLQueryEncoder {
    static var urlQueryParameter: URLQueryEncoder { URLQueryEncoder() }
    static var jsonBody: JSONBodyEncoder { JSONBodyEncoder() }
}

struct URLQueryEncoder: ParameterEncoder {
    public func encode(
        request: inout URLRequest,
        with parameters: Parameters?
    ) throws {
        guard let parameters else { return }
        
        guard let url = request.url else { throw URLError(.badURL) }
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        guard var urlComponents else { return }
        
        urlComponents.queryItems = parameters.compactMap { key, value in
            return URLQueryItem(name: key, value: "\(value)")
        }
        request.url = urlComponents.url
    }
}

struct JSONBodyEncoder: ParameterEncoder {
    public func encode(
        request: inout URLRequest,
        with parameters: Parameters?
    ) throws {
        guard let parameters else { return }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let data: Data = try JSONSerialization.data(withJSONObject: parameters)
        request.httpBody = data
    }
}
