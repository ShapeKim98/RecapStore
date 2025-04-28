//
//  RecapStoreApp.swift
//  RecapStore
//
//  Created by 김도형 on 4/25/25.
//

import SwiftUI
import SwiftData

@main
struct RecapStoreApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [
                    MyAppModel.self
                ])
        }
    }
}
