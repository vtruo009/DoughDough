//
//  DoughDoughApp.swift
//  DoughDough
//
//  Created by Van Truong on 1/7/24.
//

import SwiftUI

@main
struct DoughDoughApp: App {
    var body: some Scene {
        WindowGroup {
                MainTabView().environmentObject(ItemData())
        }
    }
}
