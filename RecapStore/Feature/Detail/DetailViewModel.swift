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
    
    private let toastRouter = ToastRouter.shared
    private let networkMonitor = NetworkMonitor.shared
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
    
    @Sendable
    func bodyTask() async {
        let publisher = await networkMonitor.publisher
        for await path in publisher {
            guard case .progress = downloadState else { continue }
            let connected = path.status == .satisfied
            
            if !connected {
                pauseDownload()
                delegate?.detailViewModelDownloadButtonAction()
            }
        }
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
            await toastRouter.presentToast("앱 조회 중 오류가 발생했어요")
            print(error)
        }
    }
    
    func startDownload() {
        let timer = Timer.publish(
            every: 0.1,
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
