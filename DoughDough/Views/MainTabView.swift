//
//  MainTabView.swift
//  DoughDough
//
//  Created by Van Truong on 1/11/24.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var itemData: ItemData = ItemData()
    
    var body: some View {
            TabView {
                Group {
                    ItemListView(viewStyle: .backlog)
                        .tabItem { Label("Backlog", systemImage: "tray.fill") }
                    ItemListView(viewStyle: .today)
                        .tabItem { Label("Today", systemImage: "list.dash") }
                }
                .toolbar(.visible, for: .tabBar)
            }
            .environmentObject(itemData)
            .onAppear {
                itemData.loadItems()
            }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
            MainTabView()
    }
}
