//
//  ItunesEndPoint.swift
//  RecapStore
//
//  Created by 김도형 on 4/28/25.
//

import Foundation

enum ItunesEndPoint: EndPoint {
    case lookup(model: LookupRequest)
    case search(model: SearchRequest)
    
    var path: String {
        switch self {
        case .lookup: return "/lookup"
        case .search: return "/search"
        }
    }
    
    var method: Method {
        switch self {
        case .lookup,
             .search:
            return .get
        }
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    var decoder: JSONDecoder {
        JSONDecoder()
    }
    
    var encoder: (any ParameterEncoder)? {
        switch self {
        case .lookup,
             .search:
            return .urlQueryParameter
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case let .lookup(model):
            return .makeNotNilParameters(model)
        case let .search(model):
            return .makeNotNilParameters(model)
        }
    }
    
}
