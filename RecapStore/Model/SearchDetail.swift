//
//  SearchDetail.swift
//  RecapStore
//
//  Created by 김도형 on 4/27/25.
//

import Foundation

struct SearchDetail: Decodable {
    let artworkUrl100: String
    let screenshotUrls: [String]
    let trackName: String
    let contentAdvisoryRating: String
    let price: Double?
    let averageUserRating: Double
    let userRatingCount: Int
    let currentVersionReleaseDate: String?
    let releaseNotes: String?
    let version: String
    let description: String
    let genres: [String]
}
