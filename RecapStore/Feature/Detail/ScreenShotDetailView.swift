//
//  ScreenShotDetailView.swift
//  RecapStore
//
//  Created by 김도형 on 4/28/25.
//

import SwiftUI

struct ScreenShotDetailView: View {
    @Environment(\.dismiss)
    private var dismiss
    
    @Binding
    private var downloadState: RSDownloadButtonStyle.ButtonState
    
    private let urls: [String]
    private let downloadButtonAction: () -> Void
    
    init(
        urls: [String],
        downloadState: Binding<RSDownloadButtonStyle.ButtonState>,
        downloadButtonAction: @escaping () -> Void
    ) {
        self.urls = urls
        self._downloadState = downloadState
        self.downloadButtonAction = downloadButtonAction
    }
    
    var body: some View {
        NavigationStack(root: root)
    }
}

//MARK: - Configure Views
private extension ScreenShotDetailView {
    func root() -> some View {
        VStack {
            ScrollView(.horizontal, content: content)
                .scrollTargetBehavior(.viewAligned)
                .safeAreaPadding(20)
                .contentMargins(12)
            
            Spacer()
        }
        .toolbar(content: toolbarContent)
    }
    
    func content() -> some View {
        LazyHStack(spacing: 20) {
            ForEach(urls, id: \.self) { url in
                CachedAsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .rsImageStyle(radius: 30)
                        .frame(maxHeight: .infinity)
                }
                .containerRelativeFrame(
                    .horizontal,
                    count: urls.count,
                    span: urls.count,
                    spacing: 0
                )
            }
        }
        .scrollTargetLayout()
        .frame(maxHeight: .infinity)
    }
    
    @ToolbarContentBuilder
    func toolbarContent() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button("완료") {
                dismiss()
            }
        }
        
        ToolbarItem(placement: .topBarTrailing) {
            Button(downloadState.title) {
                downloadButtonAction()
            }
            .buttonStyle(.download(downloadState))
            .animation(.easeInOut, value: downloadState)

        }
    }
}

#Preview {
    ScreenShotDetailView(
        urls: [
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/ed/23/4f/ed234f0e-ff53-b73b-a60b-9edf2d772afe/iOS_5.5_01.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/3d/cf/52/3dcf52a0-604d-24d7-b5b2-5f820db5ad0a/iOS_5.5_02.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/bd/e9/fc/bde9fcd9-f6e0-cca6-c876-4f0f6be22229/iOS_5.5_03.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/43/66/d8/4366d87e-3207-9555-5609-2c87b015c739/iOS_5.5_04.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/3a/71/58/3a7158fc-42f5-d2af-35a3-25d76e67a244/iOS_5.5_05.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/27/b6/17/27b61713-7075-3fd0-318d-8bc35b530917/iOS_5.5_06.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/ba/02/71/ba02715a-c3d5-b062-8ec6-9c2c227c497f/iOS_5.5_07.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/18/8d/23/188d2351-be90-918a-17ae-4bedfd233828/iOS_5.5_08.jpg/392x696bb.jpg"
        ],
        downloadState: .constant(.default("열기")),
        downloadButtonAction: {}
    )
}
