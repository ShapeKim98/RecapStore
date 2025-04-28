//
//  SearchViewModel.swift
//  RecapStore
//
//  Created by 김도형 on 4/27/25.
//

import Foundation
import Observation

@MainActor
@Observable
final class SearchViewModel {
    private let toastRouter = ToastRouter.shared
    private let itunesClient = ItunesClient.shared
    
    var results: [SearchResult] = []
    var searchableText = ""
    var isLoading = false
    var hasNext = true
    
    func searchOnSubmit() {
        guard searchableText.filter(\.isLetter).count > 0 else {
            return
        }
        
        results.removeAll()
        isLoading = true
        Task { [weak self] in
            defer { self?.isLoading = false }
            await self?.fetchSearch()
        }
    }
    
    @Sendable
    func progressViewTask() async {
        await fetchSearch()
    }
}

// MARK: - Functions
private extension SearchViewModel {
    func fetchSearch() async {
        do {
            let request = SearchRequest(
                term: searchableText,
                offset: results.count
            )
            let results = try await itunesClient.search(request)
            hasNext = results.count >= 25
            self.results.append(contentsOf: results)
        } catch {
            await toastRouter.presentToast("검색하는 중 오류가 발생했어요")
        }
    }
}
