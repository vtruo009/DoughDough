//
//  MainTabView.swift
//  TimeDebt
//
//  Created by Van Truong on 1/11/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
            TabView {
                Group {
                    TodayView()
                        .tabItem { Label("Today", systemImage: "list.dash") }
                }
                .toolbar(.visible, for: .tabBar)
            }
            .environmentObject(ItemData())
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
            MainTabView().environmentObject(ItemData())
    }
}
