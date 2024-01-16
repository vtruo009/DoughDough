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
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(itemData.testItems, id: \.self.id) { item in
                    ItemView(item: item)
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
                        Image(systemName: "plus").foregroundColor(.orange)
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
