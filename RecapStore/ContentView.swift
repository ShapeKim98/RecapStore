//
//  ContentView.swift
//  RecapStore
//
//  Created by 김도형 on 4/25/25.
//

import SwiftUI

struct ContentView: View {
    @State
    private var currentTabId: Int = 2
    @State
    private var toastMessage: String? = nil
    
    private let toastRouter = ToastRouter.shared
    private let networkMonitor = NetworkMonitor.shared
    
    var body: some View {
        TabView(selection: $currentTabId) {
            VStack{
                Spacer()
            }
            .tabItem {
                Image(systemName: "doc.text.image")
                
                Text("투데이")
            }
            .tag(0)
            
            VStack{
                Spacer()
            }
            .tabItem {
                Image(.rocket)
                
                Text("게임")
            }
            .tag(1)
            
            MyAppView(viewModel: MyAppViewModel())
                .tabItem {
                    Image(systemName: "square.stack.3d.up.fill")
                    
                    Text("앱")
                }
                .tag(2)
            
            VStack{
                Spacer()
            }
            .tabItem {
                Image(systemName: "arcade.stick")
                
                Text("아케이드")
            }
            .tag(3)
            
            SearchView(viewModel: SearchViewModel())
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    
                    Text("검색")
                }
                .tag(4)
        }
        .overlay(alignment: .top) {
            if let toastMessage {
                HStack(spacing: 8) {
                    Text(toastMessage)
                    
                    Button("닫기", systemImage: "xmark.circle.fill") {
                        toastRouter.dismissToast()
                    }
                    .buttonStyle(.plain)
                    .labelStyle(.iconOnly)
                }
                .font(.title3)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 9999, style: .continuous))
                .clipped()
                .shadow(radius: 8)
                .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .animation(.bouncy, value: toastMessage)
        .task {
            for await message in toastRouter.publisher {
                toastMessage = message
            }
        }
        .task {
            for await path in await networkMonitor.publisher {
                if path.status == .satisfied {
                    toastRouter.dismissToast()
                } else {
                    await toastRouter.presentToast("네트워크 연결 상태를 확인해주세요.")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
