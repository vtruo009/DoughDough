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
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Today")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
            }
            ToolbarItem(placement: .cancellationAction) {
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.white)
            }
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color.black, for: .navigationBar)
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TodayView().environmentObject(TaskData())
        }
    }
}
