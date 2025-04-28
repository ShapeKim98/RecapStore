//
//  DetailView.swift
//  RecapStore
//
//  Created by 김도형 on 4/28/25.
//

import SwiftUI

struct DetailView: View {
    @Namespace
    private var zoomTransition
    
    @Environment(\.colorScheme)
    private var colorScheme
    
    @State
    private var sourceId: SourceID?
    
    @Bindable
    private var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        if viewModel.isLoading {
            ProgressView()
                .controlSize(.regular)
                .task(viewModel.progressViewTask)
        } else {
            ScrollView(content: content)
                .task(viewModel.bodyTask)
                .animation(.bouncy, value: viewModel.isMoreDescription)
                .animation(.bouncy, value: viewModel.isMoreWhatsNew)
                .fullScreenCover(item: $sourceId) { sourceId in
                    let urls = viewModel.detail?.screenshotUrls ?? []
                    ScreenShotDetailView(
                        urls: urls,
                        downloadState: $viewModel.downloadState,
                        downloadButtonAction: viewModel.downloadButtonAction
                    )
                    .zoomTransition(
                        sourceID: sourceId,
                        in: zoomTransition
                    )
                }
        }
    }
}

// MARK: - Configure Views
private extension DetailView {
    func content() -> some View {
        VStack(spacing: 0) {
            if let detail = viewModel.detail {
                titleSection(detail)
                
                Divider()
                    .padding(.horizontal, 20)
                
                informationSection(detail)
                
                Divider()
                    .padding(.horizontal, 20)
                    .padding(.bottom, 12)
                
                whatsNewSection(detail)
                
                screenShots(urls: detail.screenshotUrls)
                
                Divider()
                    .padding(.vertical, 20)
                    .padding(.horizontal, 20)
                
                descriptionSection(detail.description)
            }
        }
    }
    
    func titleSection(_ detail: SearchDetail) -> some View {
        HStack(spacing: 16) {
            CachedAsyncImage(url: detail.artworkUrl100) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .rsImageStyle(radius: 26)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(detail.trackName)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                
                Spacer()
                
                HStack {
                    Button(viewModel.downloadState.title) {
                        viewModel.downloadButtonAction()
                    }
                    .buttonStyle(.download(viewModel.downloadState))
                    .animation(.easeInOut, value: viewModel.downloadState)
                    
                    Spacer()
                }
            }
        }
        .padding(.bottom, 20)
        .padding(.horizontal, 20)
    }
    
    func informationSection(_ detail: SearchDetail) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                informationItem(
                    title: "버전",
                    content: detail.minimumOsVersion + "+"
                )
                .font(.title3)
                .fontWeight(.semibold)
                
                Divider()
                
                informationItem(
                    title: "연령",
                    content: detail.contentAdvisoryRating
                )
                .font(.title3)
                .fontWeight(.semibold)
                
                Divider()
                
                informationItem(
                    title: "카테고리",
                    content: detail.genres.prefix(1).joined(
                        separator: " 및 "
                    )
                )
                .font(.subheadline)
                .fontWeight(.bold)
                
                Divider()
                
                informationItem(
                    title: "개발자",
                    content: detail.sellerName
                )
                .font(.footnote)
                .fontWeight(.bold)
                
                Spacer()
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 20)
        }
    }
    
    func informationItem(
        title: String,
        content: String
    ) -> some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.caption)
                .fontWeight(.regular)
            
            Text(content)
        }
        .foregroundStyle(.secondary)
        .frame(minWidth: 80)
    }
    
    @ViewBuilder
    func screenShots(urls: [String]) -> some View {
        if !urls.isEmpty {
            VStack(alignment: .leading, spacing: 12) {
                Text("미리보기")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    screenShotsScrollViewContent(urls: urls)
                }
                .scrollTargetBehavior(.viewAligned)
            }
        }
    }
    
    func screenShotsScrollViewContent(urls: [String]) -> some View {
        LazyHStack(spacing: 8) {
            ForEach(urls, id: \.self) { url in
                let id = SourceID(id: url)
                
                Button {
                    sourceId = id
                } label: {
                    CachedAsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 220)
                            .rsImageStyle(radius: 26)
                    }
                    .transitionSource(sourceID: id, in: zoomTransition)
                }
                .buttonStyle(.plain)
            }
        }
        .scrollTargetLayout()
        .padding(.horizontal, 20)
    }
    
    func descriptionSection(_ description: String) -> some View {
        HStack {
            Group {
                if viewModel.isMoreDescription {
                    Text(description)
                } else {
                    Text(description)
                        .lineLimit(3)
                }
            }
            .transition(.opacity)
            .font(.subheadline)
            .truncationMode(.tail)
            
            Spacer()
        }
        .overlay(alignment: .bottomTrailing) {
            moreButton(isTapped: viewModel.isMoreDescription) {
                viewModel.moreDescriptionButtonAction()
            }
        }
        .padding(.bottom, 40)
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    func moreButton(isTapped: Bool, action: @escaping () -> Void) -> some View {
        let shadowColor: Color = colorScheme == .light ? .white : .black
        
        Button(isTapped ? "간략히" : "더보기", action: action)
            .font(.subheadline)
            .background(.background)
            .shadow(
                color: shadowColor,
                radius: 12
            )
    }
    
    @ViewBuilder
    func whatsNewSection(_ detail: SearchDetail) -> some View {
        let releaseNotes = detail.releaseNotes
        let releaseDate = detail.currentVersionReleaseDate?.toDate(.releaseDate)
        
        if let releaseNotes, let releaseDate {
            VStack(alignment: .leading, spacing: 12) {
                Text("새로운 소식")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                
                HStack {
                    Text("버전 " + detail.version)
                    
                    Spacer()
                    
                    Text(releaseDate, style: .relative) +
                    Text("전")
                }
                .font(.footnote)
                .foregroundStyle(.secondary)
                
                Group {
                    if viewModel.isMoreWhatsNew {
                        Text(releaseNotes)
                    } else {
                        Text(releaseNotes)
                            .lineLimit(3)
                    }
                }
                .transition(.opacity)
                .font(.subheadline)
                .truncationMode(.tail)
            }
            .overlay(alignment: .bottomTrailing) {
                moreButton(isTapped: viewModel.isMoreWhatsNew) {
                    viewModel.moreWhatsNewButtonAction()
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 28)
        }
    }
}

private extension DetailView {
    struct SourceID: Identifiable, Hashable {
        let id: String
    }
}

#Preview {
    DetailView(
        viewModel: DetailViewModel(
            trackId: 1258016944,
            downloadState: .default("받기")
        )
    )
}
