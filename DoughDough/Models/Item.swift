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
    var isDone: Bool = false
    var dateAssigned: Date?
    var notes: String
    
    init(title: String, timeToComplete: Int, notes: String, date: Date?) {
        self.title = title
        self.timeToComplete = timeToComplete
        self.notes = notes
        if let dateAssigned = date {
            self.dateAssigned = dateAssigned
        }
    }
    
    init() {
        self.init(title: "New item", timeToComplete: 0, notes: "", date: nil)
    }
}

extension Item {
    static let testItems: [Item] = [
        Item(title: "Build portfolio project", timeToComplete: 60, notes: "This is a test note", date: Date()),
        Item(title: "Buy milk", timeToComplete: 15, notes: "This is a test note", date: nil),
        Item(title: "Dishes", timeToComplete: 30, notes: "This is a test note", date: nil),
    ]
}
