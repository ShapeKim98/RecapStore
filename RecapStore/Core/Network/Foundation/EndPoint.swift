//
//  EndPoint.swift
//  RecapStore
//
//  Created by 김도형 on 4/26/25.
//

import Foundation

protocol EndPoint {
    var baseURL: String { get }
    var path: String { get }
    var method: Method { get }
    var headers: [String: String] { get }
    var decoder: JSONDecoder { get }
    var encoder: ParameterEncoder? { get }
    var parameters: Parameters? { get }
//    func error(_ statusCode: Int?, data: Data) -> Error
}

extension EndPoint {
    var baseURL: String {
//        return Bundle.main.baseURL
        return ""
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: baseURL + path)
        guard let url else { throw URLError(.badURL) }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        if let encoder, let parameters {
            try encoder.encode(request: &request, with: parameters)
        }
        return request
    }
    
//    func error(_ statusCode: Int?, data: Data) -> Error {
//        return
//    }
}
