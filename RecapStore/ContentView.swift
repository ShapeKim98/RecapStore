//
//  ContentView.swift
//  RecapStore
//
//  Created by 김도형 on 4/25/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SearchView(viewModel: SearchViewModel())
    }
}

#Preview {
    ContentView()
}
