//
//  DetailViewModel.swift
//  RecapStore
//
//  Created by 김도형 on 4/28/25.
//

import Foundation
import Observation

@MainActor
protocol DetailViewModelDelegate: AnyObject {
    func detailViewModelDownloadButtonAction()
}

@MainActor
@Observable
final class DetailViewModel: NSObject {
    @ObservationIgnored
    @Shared(.userDefaults(.download))
    private var downloadProgress = [String: Double]()
    @ObservationIgnored
    private var downloadTask: Task<Void, Never>?
    
    @ObservationIgnored
    weak var delegate: DetailViewModelDelegate?
    
    private let itunesClient = ItunesClient.shared
    private let trackId: Int
    
    init(
        trackId: Int,
        downloadState: RSDownloadButtonStyle.ButtonState
    ) {
        self.trackId = trackId
        self.downloadState = downloadState
        
        super.init()
        
        if case .progress = downloadState {
            startDownload()
        }
    }
    
    var isLoading = true
    var detail: SearchDetail?
    var isMoreDescription = false
    var isMoreWhatsNew = false
    
    var downloadState: RSDownloadButtonStyle.ButtonState
    
    func moreDescriptionButtonAction() {
        isMoreDescription.toggle()
    }
    
    func moreWhatsNewButtonAction() {
        isMoreWhatsNew.toggle()
    }
    
    func downloadButtonAction() {
        delegate?.detailViewModelDownloadButtonAction()
        if downloadTask == nil {
            startDownload()
        } else {
            pauseDownload()
        }
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
    
    func startDownload() {
        let timer = Timer.publish(
            every: 0.01,
            on: .main,
            in: .common
        ).autoconnect()
        
        downloadTask = Task { [weak self] in
            for await _ in timer.values {
                guard let `self` else { return }
                
                let progress = downloadProgress?[trackId.description] ?? 0.0
                downloadState = .progress(progress)
                
                guard progress >= 1 else { continue }
                
                downloadTask?.cancel()
                downloadTask = nil
                downloadState = .default("열기")
            }
        }
    }
    
    func pauseDownload() {
        downloadTask?.cancel()
        downloadTask = nil
        downloadState = .resume
    }
}
