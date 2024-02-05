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
    var duration: Duration
    var isDone: Bool = false
    var dateAssigned: Date?
    var notes: String
    
    init(title: String, duration: Duration, notes: String, date: Date?) {
        self.title = title
        self.duration = duration
        self.notes = notes
        if let dateAssigned = date {
            self.dateAssigned = dateAssigned
        }
    }
    
    init() {
        self.init(title: "New item", duration: Duration(hour: 0, minute: 0), notes: "", date: nil)
    }
}

struct Duration: Hashable, Codable {
    var hour: Int
    var minute: Int
    
    enum durationStringStyle {
        case horizontal
        case vertical
    }
    
    init(hour: Int, minute: Int) {
        self.hour = hour
        self.minute = minute
    }
    
    init() {
        self.init(hour: 0, minute: 0)
    }
    
    private var hourDisplayString: String {
        hour == 0 ? "" : "\(hour)h"
    }
    
    private var minuteDisplayString: String {
        minute == 0 ? "" : "\(minute)m"
    }
    
    func formattedDuration(style: durationStringStyle) -> String {
        switch(style) {
            case .horizontal:
                "\(hourDisplayString) \(minuteDisplayString)"
            case .vertical:
                "\(hourDisplayString)\n\(minuteDisplayString)"
        }
    }
}

extension Item {
    static let testItems: [Item] = [
        Item(title: "Build portfolio project", duration: Duration(hour: 1, minute: 0), notes: "Make some progress everyday", date: Date()),
        Item(title: "Buy milk", duration: Duration(hour: 0, minute: 15), notes: "", date: nil),
        Item(title: "Dishes", duration: Duration(hour: 0, minute: 30), notes: "Wash all cups first", date: nil),
    ]
}
