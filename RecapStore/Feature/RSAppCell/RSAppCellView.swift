//
//  RSAppCellView.swift
//  RecapStore
//
//  Created by 김도형 on 4/27/25.
//

import SwiftUI

struct RSAppCellView: View {
    private let viewModel: RSAppCellViewModel
    
    init(viewModel: RSAppCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack(spacing: 8) {
            CachedAsyncImage(url: viewModel.app.artworkUrl60) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .rsImageStyle()
                    .frame(width: 60, height: 60)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.app.trackName)
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                    .lineLimit(1)
                
                Text(viewModel.app.subtitle)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Button(viewModel.downloadState.title) {
                viewModel.downloadButtonAction()
            }
            .buttonStyle(.download(viewModel.downloadState))
            .onAppear(perform: viewModel.buttonOnAppear)
            .animation(.easeInOut, value: viewModel.downloadState)
        }
        .contentShape(Rectangle())
        .task(viewModel.bodyTask)
    }
}

protocol RSAppCellDisplayable {
    var trackName: String { get }
    var trackId: Int { get }
    var artworkUrl60: String { get }
    var subtitle: String { get }
}

#Preview {
    RSAppCellView(viewModel: RSAppCellViewModel(app: SearchResult.mock))
}
