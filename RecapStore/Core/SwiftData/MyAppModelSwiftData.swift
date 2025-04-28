//
//  MyAppModelSwiftData.swift
//  RecapStore
//
//  Created by 김도형 on 4/28/25.
//

import Foundation
import SwiftData
import Combine

@MainActor
final class MyAppModelSwiftData {
    static let shared = MyAppModelSwiftData()
    
    private let context: ModelContext?
    
    private let subject = PassthroughSubject<Void, Never>()
    
    var publisher: AnyPublisher<Void, Never> {
        subject.eraseToAnyPublisher()
    }
    
    private init() {
        do {
            let container = try ModelContainer(
                for: MyAppModel.self,
                configurations: .init(cloudKitDatabase: .automatic)
            )
            self.context = ModelContext(container)
        } catch {
            context = nil
            print(error)
        }
    }
    
    func fetch(id: Int) async throws -> MyAppModel? {
        let predicate = #Predicate<MyAppModel> {
            $0.trackId == id
        }
        let descriptor: FetchDescriptor<MyAppModel> = .init(
            predicate: predicate
        )
        let result = try self.context?.fetch(descriptor).first
        
        return result
    }
    
    func fetchList() async throws -> [MyAppModel] {
        let descriptor: FetchDescriptor<MyAppModel> = .init(
            sortBy: [SortDescriptor(\.date, order: .reverse)]
        )
        let result: [MyAppModel]
        result = try context?.fetch(descriptor) ?? []
        return result
    }
    
    func fetchQueryList(_ query: String) async throws -> [MyAppModel] {
        let predicate = #Predicate<MyAppModel> {
            query.isEmpty ||
            $0.trackName.localizedStandardContains(query)
        }
        let descriptor: FetchDescriptor<MyAppModel> = .init(
            predicate: predicate,
            sortBy: [SortDescriptor(\.date, order: .reverse)]
        )
        let result: [MyAppModel]
        result = try context?.fetch(descriptor) ?? []
        return result
    }
    
    func save(_ model: MyAppModel) async throws {
        context?.insert(model)
        try context?.save()
        subject.send(())
    }
    
    func update(at id: Int, model: MyAppModel) async throws {
        let oldModel = try await fetch(id: id)
        oldModel?.artworkUrl60 = model.artworkUrl60
        oldModel?.date = model.date
        oldModel?.trackId = model.trackId
        oldModel?.trackName = model.trackName
        try context?.save()
        subject.send(())
    }
    
    func delete(at id: Int) async throws {
        let model = try await fetch(id: id)
        guard let model else { return }
        context?.delete(model)
        try context?.save()
        subject.send(())
    }
}
