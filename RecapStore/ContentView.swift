//
//  ContentView.swift
//  RecapStore
//
//  Created by 김도형 on 4/25/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RSAppCellView(viewModel: RSAppCellViewModel(app: SearchResult.mock))
    }
}

#Preview {
    ContentView()
}
