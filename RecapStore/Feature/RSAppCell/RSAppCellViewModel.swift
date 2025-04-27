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
    
    let app: RSAppCellDisplayable
    
    var downloadState: RSDownloadButtonStyle.ButtonState = .default
    var downloadButtonTitle = "받기"
    
    init(app: RSAppCellDisplayable) {
        self.app = app
        let progress = downloadProgress?[app.trackId.description]
        
        guard let progress else { return }
        if progress >= 1 {
            downloadState = .default
            downloadButtonTitle = "완료"
        } else if progress == 0 {
            downloadState = .again
        } else {
            downloadButtonTitle = "재개"
            downloadState = .resume
        }
    }
    
    func downloadButtonAction() {
        // 임시
        if let progress = downloadProgress?[app.trackId.description], progress >= 1 {
            downloadProgress?[app.trackId.description] = 0
            downloadState = .again
            return
        }
        
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
            every: 0.01,
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
                print(progress)
                if progress >= 1 {
                    downloadTask?.cancel()
                    downloadTask = nil
                    downloadState = .default
                    downloadButtonTitle = "완료"
                }
                time = now
            }
        }
    }
    
    func pauseDownload() {
        downloadTask?.cancel()
        downloadTask = nil
        downloadState = .resume
        downloadButtonTitle = "재개"
    }
}
