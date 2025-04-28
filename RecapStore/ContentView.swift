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
    }
}

#Preview {
    ContentView()
}
