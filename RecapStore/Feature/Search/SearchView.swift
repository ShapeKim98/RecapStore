//
//  SearchView.swift
//  RecapStore
//
//  Created by 김도형 on 4/27/25.
//

import SwiftUI

struct SearchView: View {
    @Bindable
    private var viewModel: SearchViewModel
    
    @State
    private var path = [SearchPath]()
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack(path: $path, root: root)
            .animation(.smooth, value: viewModel.isLoading)
            .searchable(text: $viewModel.searchableText)
            .onSubmit(of: .search, viewModel.searchOnSubmit)
            .task(bodyTask)
    }
}

// MARK: - Configure Views
private extension SearchView {
    @ViewBuilder
    func root() -> some View {
        if viewModel.isLoading {
            ProgressView()
                .controlSize(.regular)
        } else {
            ScrollView(content: content)
                .navigationTitle("검색")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: SearchPath.self) { path in
                    switch path {
                    case let .appDetail(viewModel):
                        DetailView(viewModel: viewModel)
                    }
                }
        }
    }
    
    func content() -> some View {
        LazyVStack {
            searchResultSection
            
            if viewModel.hasNext && !viewModel.results.isEmpty {
                ProgressView()
                    .controlSize(.regular)
                    .task(viewModel.progressViewTask)
            }
        }
        .padding(.horizontal, 16)
    }
    
    var searchResultSection: some View {
        LazyVStack(spacing: 32) {
            ForEach(viewModel.results, id: \.trackId) { result in
                let viewModel = RSAppCellViewModel(app: result)
                
                Button {
                    let detailViewModel = DetailViewModel(
                        trackId: result.trackId,
                        downloadState: viewModel.downloadState
                    )
                    detailViewModel.delegate = viewModel
                    path.append(.appDetail(viewModel: detailViewModel))
                } label: {
                    SearchResultCell(
                        result: result,
                        viewModel: viewModel
                    )
                }
                .buttonStyle(.plain)
            }
        }
    }
}

// MARK: - Cell
private extension SearchView {
    struct SearchResultCell: View {
        @State
        private var result: SearchResult
        
        private let viewModel: RSAppCellViewModel
        
        init(
            result: SearchResult,
            viewModel: RSAppCellViewModel
        ) {
            self.result = result
            self.viewModel = viewModel
        }
        
        var body: some View {
            VStack(spacing: 16) {
                RSAppCellView(viewModel: viewModel)
                
                information
                
                screenShots
            }
            .task(bodyTask)
        }
        
        private var information: some View {
            HStack {
                Text("iOS " + result.minimumOsVersion)
                
                Spacer()
                
                HStack(spacing: 4) {
                    Image(systemName: "person.crop.square")
                    
                    Text(result.artistName)
                        .fontWeight(.bold)
                        .lineLimit(1)
                }
                
                Spacer()
                
                Text(result.primaryGenreName)
            }
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        
        private var screenShots: some View {
            HStack(spacing: 12) {
                ForEach(result.screenshotUrls.prefix(3), id: \.self) { url in
                    CachedAsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .rsImageStyle()
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        
        @Sendable
        private func bodyTask() async {
            guard let url = result.screenshotUrls.first else { return }
            let uiImage: UIImage? = try? await ImageCacheManager().fetchImage(url)
            guard let uiImage else { return }
            guard uiImage.size.width < uiImage.size.height else {
                result.screenshotUrls = [url]
                return
            }
        }
    }
}

#Preview {
    SearchView(viewModel: SearchViewModel())
}
