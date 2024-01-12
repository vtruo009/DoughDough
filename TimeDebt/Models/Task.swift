//
//  Tasks.swift
//  TimeDebt
//
//  Created by Van Truong on 1/7/24.
//

import Foundation
import SwiftUI

struct Task: Identifiable {
    var id = UUID()
    
    var title: String
    var timeToComplete: Int
    
    init(title: String, timeToComplete: Int) {
        self.title = title
        self.timeToComplete = timeToComplete
    }
    
    init() {
        self.init(title: "Task 1", timeToComplete: 1)
    }
}

extension Task {
    static let testTasks: [Task] = [
        Task(title: "Task #1", timeToComplete: 60),
        Task(title: "Task #2", timeToComplete: 15),
        Task(title: "Task #3", timeToComplete: 10),
//        Task(title: "Task #1", timeToComplete: 60),
//        Task(title: "Task #2", timeToComplete: 15),
//        Task(title: "Task #3", timeToComplete: 10),
//        Task(title: "Task #1", timeToComplete: 60),
//        Task(title: "Task #2", timeToComplete: 15),
//        Task(title: "Task #3", timeToComplete: 10),
//        Task(title: "Task #1", timeToComplete: 60),
//        Task(title: "Task #2", timeToComplete: 15),
//        Task(title: "Task #3", timeToComplete: 10),
//        Task(title: "Task #1", timeToComplete: 60),
//        Task(title: "Task #2", timeToComplete: 15),
//        Task(title: "Task #3", timeToComplete: 10),
//        Task(title: "Task #1", timeToComplete: 60),
//        Task(title: "Task #2", timeToComplete: 15),
//        Task(title: "Task #3", timeToComplete: 10),
    ]
}
