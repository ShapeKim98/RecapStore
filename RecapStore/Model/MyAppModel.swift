//
//  DownloadedApp.swift
//  RecapStore
//
//  Created by 김도형 on 4/28/25.
//

import Foundation
import SwiftData

@Model
final class MyAppModel {
    var trackId: Int
    var artworkUrl60: String
    var trackName: String
    var date: String
    
    init(
        artworkUrl60: String,
        trackName: String,
        trackId: Int,
        date: String
    ) {
        self.artworkUrl60 = artworkUrl60
        self.trackName = trackName
        self.trackId = trackId
        self.date = date
    }
}

extension MyAppModel: RSAppCellDisplayable {
    var subtitle: String { self.date }
}
