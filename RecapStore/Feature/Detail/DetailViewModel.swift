//
//  DetailViewModel.swift
//  RecapStore
//
//  Created by 김도형 on 4/28/25.
//

import Foundation
import Observation

@MainActor
@Observable
final class DetailViewModel: NSObject {
    private let itunesClient = ItunesClient.shared
    private let trackId: Int
    
    init(trackId: Int) {
        self.trackId = trackId
    }
    
    var isLoading = true
    var detail: SearchDetail?
    var isMoreDescription = false
    var isMoreWhatsNew = false
    
    var downloadState: RSDownloadButtonStyle.ButtonState = .default("받기")
    
    func moreDescriptionButtonAction() {
        isMoreDescription.toggle()
    }
    
    func moreWhatsNewButtonAction() {
        isMoreWhatsNew.toggle()
    }
    
    @Sendable
    func progressViewTask() async {
        await fetchLookup()
    }
}

// MARK: - Functions
private extension DetailViewModel {
    func fetchLookup() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let request = LookupRequest(id: "\(trackId)")
            let results = try await itunesClient.lookup(request)
            self.detail = results
        } catch {
            print(error)
        }
    }
}
