//
//  MyAppViewModel.swift
//  RecapStore
//
//  Created by 김도형 on 4/28/25.
//

import SwiftUI
import SwiftData

@MainActor
@Observable
final class MyAppViewModel {
    @ObservationIgnored
    @Shared(.userDefaults(.download))
    private var downloadProgress = [String: Double]()
    @ObservationIgnored
    private var fetchQueryListTask: Task<Void, Never>?
    
    private let myAppSwiftData = MyAppModelSwiftData.shared
    
    var myAppList: [MyAppModel] = []
    var searchableText = ""
    var isLoading = true
    
    @Sendable
    func bodyTask() async {
        await fetchList()
        isLoading = false
        
        for await _ in myAppSwiftData.publisher().values {
            await fetchList()
        }
    }
    
    func appCellSwipeActions(trackId: Int) {
        Task { [weak self] in
            do {
                try await self?.myAppSwiftData.delete(at: trackId)
                self?.downloadProgress?[trackId.description] = 0
                self?.myAppList.removeAll(where: { $0.trackId == trackId })
            } catch {
                print(error)
            }
        }
    }
    
    func searchableTextOnChange(
        _ oldValue: String,
        _ newValue: String
    ) {
        fetchQueryListTask?.cancel()
        
        fetchQueryListTask = Task { [weak self] in
            self?.isLoading = true
            defer { self?.isLoading = false }
            try? await Task.sleep(for: .milliseconds(300))
            
            await self?.fetchQueryList(newValue)
        }
    }
}

// MARK: - Functions
private extension MyAppViewModel {
    func fetchQueryList(_ query: String) async {
        do {
            myAppList = try await myAppSwiftData.fetchQueryList(query)
        } catch {
            print(error)
        }
    }
    
    func fetchList() async {
        do {
            myAppList = try await myAppSwiftData.fetchList()
        } catch {
            print(error)
        }
    }
}
