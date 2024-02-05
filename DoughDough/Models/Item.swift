//
//  Item.swift
//  DoughDough
//
//  Created by Van Truong on 1/7/24.
//

import Foundation
import SwiftUI

struct Item: Identifiable, Codable {
    var id = UUID()
    
    var title: String
    var duration: TimeToComplete
    var isDone: Bool = false
    var dateAssigned: Date?
    var notes: String
    
    init(title: String, timeToComplete: TimeToComplete, notes: String, date: Date?) {
        self.title = title
        self.duration = timeToComplete
        self.notes = notes
        if let dateAssigned = date {
            self.dateAssigned = dateAssigned
        }
    }
    
    init() {
        self.init(title: "New item", timeToComplete: TimeToComplete(hour: 0, minute: 0), notes: "", date: nil)
    }
    
    var formattedDuration: String {
        let h: String = duration.hour == 0 ? "" : "\(duration.hour)h"
        let m: String = duration.minute == 0 ? "" : "\(duration.minute)m"
        return "\(h) \(m)"
    }
}

struct TimeToComplete: Hashable, Codable {
    var hour: Int
    var minute: Int
    
    init(hour: Int, minute: Int) {
        self.hour = hour
        self.minute = minute
    }
    
    init() {
        self.init(hour: 0, minute: 0)
    }
}

extension Item {
    static let testItems: [Item] = [
        Item(title: "Build portfolio project", timeToComplete: TimeToComplete(hour: 1, minute: 0), notes: "Make some progress everyday", date: Date()),
        Item(title: "Buy milk", timeToComplete: TimeToComplete(hour: 0, minute: 15), notes: "", date: nil),
        Item(title: "Dishes", timeToComplete: TimeToComplete(hour: 0, minute: 30), notes: "Wash all cups first", date: nil),
    ]
}
