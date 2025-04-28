//
//  RSAppCellViewModel.swift
//  RecapStore
//
//  Created by 김도형 on 4/27/25.
//

import Foundation
import Observation

@MainActor
@Observable
final class RSAppCellViewModel {
    @ObservationIgnored
    @Shared(.userDefaults(.download))
    private var downloadProgress = [String: Double]()
    @ObservationIgnored
    private var time: CFAbsoluteTime = CFAbsoluteTimeGetCurrent()
    @ObservationIgnored
    private var downloadTask: Task<Void, Never>?
    @ObservationIgnored
    private let myAppSwiftData = MyAppModelSwiftData.shared
    
    let app: RSAppCellDisplayable
    
    var downloadState: RSDownloadButtonStyle.ButtonState = .default("받기")
    
    init(app: RSAppCellDisplayable) {
        self.app = app
        let progress = downloadProgress?[app.trackId.description]
        
        guard let progress else { return }
        if progress >= 1 {
            downloadState = .default("열기")
        } else if progress == 0 {
            downloadState = .again
        } else {
            downloadState = .resume
        }
    }
    
    func downloadButtonAction() {
        if downloadTask == nil {
            startDownload()
        } else {
            pauseDownload()
        }
    }
}

// MARK: - Functions
private extension RSAppCellViewModel {
    func startDownload() {
        let timer = Timer.publish(
            every: 0.1,
            on: .main,
            in: .common
        ).autoconnect()
        time = CFAbsoluteTimeGetCurrent()
        downloadTask = Task { [weak self] in
            for await _ in timer.values {
                guard let `self` else { return }
                let now = CFAbsoluteTimeGetCurrent()
                
                let progress = downloadProgress?[app.trackId.description] ?? 0.0
                
                var newProgress = progress + ((now - time) / 30)
                newProgress = newProgress > 1 ? 1 : newProgress
                
                downloadProgress?[app.trackId.description] = newProgress
                downloadState = .progress(newProgress)
                if progress >= 1 {
                    downloadTask?.cancel()
                    downloadTask = nil
                    downloadState = .default("열기")
                    await saveModel()
                }
                time = now
            }
        }
    }
    
    func pauseDownload() {
        downloadTask?.cancel()
        downloadTask = nil
        downloadState = .resume
    }
    
    func saveModel() async {
        let model = MyAppModel(
            artworkUrl60: app.artworkUrl60,
            trackName: app.trackName,
            trackId: app.trackId,
            date: Date.now.toString(.myAppDate)
        )
        await myAppSwiftData.save(model)
    }
}

extension RSAppCellViewModel: DetailViewModelDelegate {
    func detailViewModelDownloadButtonAction() {
        if downloadTask == nil {
            startDownload()
        } else {
            pauseDownload()
        }
    }
}
