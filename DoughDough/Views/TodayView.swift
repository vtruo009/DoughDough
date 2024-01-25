//
//  TodayView.swift
//  DoughDough
//
//  Created by Van Truong on 1/7/24.
//

import SwiftUI

struct TodayView: View {
    @EnvironmentObject var itemData: ItemData
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: AppColor.todayColor]
    }
    
    var body: some View {
        NavigationStack {
            List {
<<<<<<< HEAD
                ForEach(itemData.testItems, id: \.self.id) { item in
                    if let date = item.dateAssigned {
                        ItemView(item: item)
                    }
=======
                ForEach(itemData.todayItems(), id: \.self.id) { item in
                        ItemView(item: item)
>>>>>>> 73fcb3c (Add filter to display Today and Backlog list)
                }
            }
            .listStyle(PlainListStyle())
            .background(.white)
            .scrollContentBackground(.hidden)
            .navigationTitle("Today")
            .toolbar {
                ToolbarItem {
                    Button {
                        print("add new item")
                    } label: {
                        Image(systemName: "plus").foregroundColor(Color(AppColor.todayColor))
                    }
                }
            }
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
            TodayView().environmentObject(ItemData())
    }
}
