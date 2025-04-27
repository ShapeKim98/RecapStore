//
//  MyAppModelSwiftData.swift
//  RecapStore
//
//  Created by 김도형 on 4/28/25.
//

import Foundation
import SwiftData

@MainActor
final class MyAppModelSwiftData {
    static let shared = MyAppModelSwiftData()
    
    private let context: ModelContext?
    
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
        let descriptor: FetchDescriptor<MyAppModel> = .init(predicate: predicate)
        let result = try self.context?.fetch(descriptor).first
        
        return result
    }
    
    func fetchList() async throws -> [MyAppModel] {
        let descriptor: FetchDescriptor<MyAppModel> = .init()
        let result: [MyAppModel]
        result = try context?.fetch(descriptor) ?? []
        return result
    }
    
    func save(_ model: MyAppModel) async {
        context?.insert(model)
    }
    
    func update(at id: Int, model: MyAppModel) async throws {
        let oldModel = try await fetch(id: id)
        oldModel?.artworkUrl60 = model.artworkUrl60
        oldModel?.date = model.date
        oldModel?.trackId = model.trackId
        oldModel?.trackName = model.trackName
        
        try context?.save()
    }
    
    func delete(at id: Int) async throws {
        let model = try await fetch(id: id)
        guard let model else { return }
        context?.delete(model)
        try context?.save()
    }
}
