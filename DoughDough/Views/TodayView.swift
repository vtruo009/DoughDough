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
    @State private var newItem: Item = Item(date: Date.now)
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(itemData.testItems, id: \.self.id) { item in
                    if let _ = item.dateAssigned {
                        ItemView(item: item).environmentObject(itemData)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .background(.white)
            .scrollContentBackground(.hidden)
            .navigationTitle("Today")
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
                                Button("Done") {
                                    itemData.addItem(item: newItem)
                                    isPresenting = false
                                }
                            }
                        }
                }
                .onDisappear {
                    itemData.saveItems()
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
