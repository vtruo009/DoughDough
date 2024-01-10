//
//  TodayView.swift
//  TimeDebt
//
//  Created by Van Truong on 1/7/24.
//

import SwiftUI

struct TodayView: View {
    @EnvironmentObject var tasks: TaskData
    
    var body: some View {
        VStack {
            List {
                ForEach(tasks.testTasks, id: \.self.id) { task in
                    Text(task.title)
                }
            }
            .background(.white)
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Today")
        .toolbar {
            ToolbarItem {
                Image(systemName: "plus")
            }
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TodayView().environmentObject(TaskData())
        }
    }
}
