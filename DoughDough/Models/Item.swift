//
//  Item.swift
//  DoughDough
//
//  Created by Van Truong on 1/7/24.
//

import Foundation
import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    
    var title: String
    var timeToComplete: Int
    var done: Bool = false
    var dateAssigned: Date?
    var notes: String
    
    init(title: String, timeToComplete: Int, notes: String) {
        self.title = title
        self.timeToComplete = timeToComplete
        self.notes = notes
    }
    
    init() {
        self.init(title: "New item", timeToComplete: 0, notes: "")
    }
}

extension Item {
    static let testItems: [Item] = [
        Item(title: "Build portfolio project", timeToComplete: 60, notes: "This is a test note"),
        Item(title: "Buy milk", timeToComplete: 15, notes: "This is a test note"),
        Item(title: "Dishes", timeToComplete: 30, notes: "This is a test note"),
    ]
}
