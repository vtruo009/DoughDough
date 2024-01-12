//
//  TodayView.swift
//  TimeDebt
//
//  Created by Van Truong on 1/7/24.
//

import SwiftUI

struct TodayView: View {
    @EnvironmentObject var tasks: TaskData
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
    }
    
    var body: some View {
        NavigationStack {
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
                    Button {
                        print("add new task")
                    } label: {
                        Image(systemName: "plus").foregroundColor(.orange)
                    }
                }
            }
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
            TodayView().environmentObject(TaskData())
    }
}
