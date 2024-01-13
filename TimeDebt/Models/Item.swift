//
//  Item.swift
//  TimeDebt
//
//  Created by Van Truong on 1/7/24.
//

import Foundation
import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    
    var title: String
    var timeToComplete: Int
    
    init(title: String, timeToComplete: Int) {
        self.title = title
        self.timeToComplete = timeToComplete
    }
    
    init() {
        self.init(title: "New item", timeToComplete: 0)
    }
}

extension Item {
    static let testItems: [Item] = [
        Item(title: "Build portfolio project", timeToComplete: 60),
        Item(title: "Buy milk", timeToComplete: 15),
        Item(title: "Dishes", timeToComplete: 30),
    ]
}
