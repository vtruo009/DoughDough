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
                    TodayView()
                        .tabItem { Label("Week", systemImage: "calendar") }
                }
                .toolbar(.visible, for: .tabBar)
            }
            .environmentObject(TaskData())
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
            MainTabView().environmentObject(TaskData())
    }
}
