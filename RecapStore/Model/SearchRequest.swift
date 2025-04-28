//
//  SearchRequest.swift
//  RecapStore
//
//  Created by 김도형 on 4/27/25.
//

import Foundation

struct SearchRequest {
    let term: String
    let country: String
    let media: String
    let limit: Int
    let offset: Int
    
    init(
        term: String,
        country: String = "kr",
        media: String = "software",
        limit: Int = 25,
        offset: Int
    ) {
        self.term = term.split(separator: " ").joined(separator: "+")
        self.country = country
        self.media = media
        self.limit = limit
        self.offset = offset
    }
}
