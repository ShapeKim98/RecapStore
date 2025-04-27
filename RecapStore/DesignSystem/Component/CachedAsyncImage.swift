//
//  CachedAsyncImage.swift
//  RecapStore
//
//  Created by 김도형 on 4/26/25.
//

import SwiftUI

struct CachedAsyncImage<ImageContent: View>: View {
    @State
    private var phase: Phase = .loading
    
    let urlString: String
    let content: (Image) -> ImageContent
    
    let imageCacheManager = ImageCacheManager()
    
    init(url: String, content: @escaping (Image) -> ImageContent) {
        self.urlString = url
        self.content = content
    }
    
    var body: some View {
        VStack {
            switch phase {
            case .loading:
                ProgressView()
                    .controlSize(.regular)
                    .task(progressViewTask)
            case .complete(let image):
                content(image)
            case .error:
                Image(systemName: "photo")
                    .foregroundStyle(.secondary)
            }
        }
        .animation(.easeInOut, value: phase)
    }
    
    @Sendable
    private func progressViewTask() async {
        do {
            let image: Image? = try await imageCacheManager.fetchImage(urlString)
            guard let image else {
                phase = .error
                return
            }
            phase = .complete(image)
        } catch {
            phase = .error
        }
    }
}

extension CachedAsyncImage {
    enum Phase: Equatable {
        case loading
        case complete(Image)
        case error
    }
}

#Preview {
    CachedAsyncImage(url: "https://dummyimage.com/300") { image in
        image
            .rotateVertical()
            .rsImageStyle()
    }
}
