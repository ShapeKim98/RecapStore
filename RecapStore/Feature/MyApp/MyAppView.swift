//
//  MyAppView.swift
//  RecapStore
//
//  Created by 김도형 on 4/28/25.
//

import SwiftUI

struct MyAppView: View {
    @Bindable
    private var viewModel: MyAppViewModel
    
    @State
    private var path = [MyAppPath]()
    
    init(viewModel: MyAppViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            root
                .navigationTitle("앱")
                .navigationBarTitleDisplayMode(.large)
                .navigationDestination(for: MyAppPath.self) { path in
                    switch path {
                    case let .appDetail(viewModel):
                        DetailView(viewModel: viewModel)
                    }
                }
        }
        .searchable(text: $viewModel.searchableText)
        .onChange(
            of: viewModel.searchableText,
            viewModel.searchableTextOnChange
        )
        .task(viewModel.bodyTask)
    }
}

//MARK: - Configure Views
private extension MyAppView {
    @ViewBuilder
    var root: some View {
        if viewModel.isLoading {
            ProgressView()
                .controlSize(.regular)
        } else {
            List(content: content)
                .listStyle(.plain)
        }
    }
    
    func content() -> some View {
        ForEach(viewModel.myAppList, id: \.trackId) { myApp in
            let viewModel = RSAppCellViewModel(app: myApp)
            Button {
                let detailViewModel = DetailViewModel(
                    trackId: myApp.trackId,
                    downloadState: viewModel.downloadState
                )
                path.append(.appDetail(viewModel: detailViewModel))
            } label: {
                RSAppCellView(viewModel: viewModel)
            }
            .swipeActions {
                Button(role: .destructive) {
                    self.viewModel.appCellSwipeActions(
                        trackId: myApp.trackId
                    )
                } label: {
                    Label("Trash", systemImage: "trash.circle")
                }
            }
        }
    }
}

#Preview {
    MyAppView(viewModel: MyAppViewModel())
}
