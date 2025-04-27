//
//  RSAppCellView.swift
//  RecapStore
//
//  Created by 김도형 on 4/27/25.
//

import SwiftUI

struct RSAppCellView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

protocol RSAppCellDisplayable {
    var trackName: String { get }
    var trackId: Int { get }
    var price: Double? { get }
    var artworkUrl60: String { get }
    var subtitle: String { get }
}

#Preview {
    RSAppCellView()
}
