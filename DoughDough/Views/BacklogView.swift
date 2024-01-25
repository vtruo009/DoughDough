//
//  BacklogView.swift
//  DoughDough
//
//  Created by Van Truong on 1/16/24.
//

import SwiftUI

struct BacklogView: View {
    @EnvironmentObject var itemData: ItemData
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: AppColor.backlogColor]
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(itemData.backlogItems(), id: \.self.id) { item in
                    ItemView(item: item)
                }
            }
            .listStyle(PlainListStyle())
            .background(.white)
            .scrollContentBackground(.hidden)
            .navigationTitle("Backlog")
            .toolbar {
                ToolbarItem {
                    Button {
                        print("add new item")
                    } label: {
                        Image(systemName: "plus").foregroundColor(Color(AppColor.backlogColor))
                    }
                }
            }
        }
    }
}

struct BacklogView_Previews: PreviewProvider {
    static var previews: some View {
        BacklogView().environmentObject(ItemData())
    }
}
