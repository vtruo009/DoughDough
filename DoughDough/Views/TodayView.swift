//
//  TodayView.swift
//  DoughDough
//
//  Created by Van Truong on 1/7/24.
//

import SwiftUI

struct TodayView: View {
    @EnvironmentObject var itemData: ItemData
    @State private var isPresenting: Bool = false
    @State private var newItem: Item = Item()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(itemData.testItems, id: \.self.id) { item in
                    if let _ = item.dateAssigned {
                        ItemView(item: item)
                    }
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
                        isPresenting = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresenting) {
                NavigationStack {
                    ItemDetailView(item: $newItem)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresenting = false
                                }
                            }
                            ToolbarItem(placement: .principal) {
                                Text("Details")
                                    .bold()
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Save") {
                                    itemData.testItems.append(newItem)
                                    isPresenting = false
                                    // Need to save data to json
                                }
                            }
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
