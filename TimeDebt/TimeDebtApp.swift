//
//  TimeDebtApp.swift
//  TimeDebt
//
//  Created by Van Truong on 1/7/24.
//

import SwiftUI

@main
struct TimeDebtApp: App {
    var body: some Scene {
        WindowGroup {
                MainTabView().environmentObject(ItemData())
        }
    }
}
