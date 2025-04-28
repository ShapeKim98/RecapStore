//
//  LookupRequest.swift
//  RecapStore
//
//  Created by 김도형 on 4/28/25.
//

import Foundation

struct LookupRequest {
    let id: String
    let country: String
    
    init(id: String, country: String = "kr") {
        self.id = id
        self.country = country
    }
}
