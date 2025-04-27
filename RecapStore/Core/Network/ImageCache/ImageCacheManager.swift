//
//  ImageCacheManager.swift
//  RecapStore
//
//  Created by 김도형 on 4/26/25.
//

import SwiftUI

struct ImageCacheManager {
    private let urlCache = URLCache.shared
    
    init() {
        self.urlCache.diskCapacity = 1024 * 1024 * 50
        self.urlCache.memoryCapacity = 1024 * 1024 * 50
    }
    
    func fetchImage(_ urlString: String) async throws -> Image? {
        guard let url = URL(string: urlString) else { return nil }
        
        let request = URLRequest(url: url)
        let uiImage: UIImage?
        
        if let cachedImage = urlCache.cachedResponse(
            for: request
        ) {
            uiImage = UIImage(data: cachedImage.data)
        } else {
            let (data, response) = try await HTTPSession.task(request)
            let cachedResponse = CachedURLResponse(response: response, data: data)
            urlCache.storeCachedResponse(cachedResponse, for: request)
            uiImage = UIImage(data: data)
        }
        guard let uiImage else { return nil }
        return Image(uiImage: uiImage)
    }
}
