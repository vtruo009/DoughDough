//
//  BacklogView.swift
//  DoughDough
//
//  Created by Van Truong on 1/16/24.
//

import SwiftUI

struct BacklogView: View {
    @EnvironmentObject var itemData: ItemData
    @State private var isPresenting: Bool = false
    @State private var newItem: Item = Item()
    
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
                        print("add new item in backlog")
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

struct BacklogView_Previews: PreviewProvider {
    static var previews: some View {
        BacklogView().environmentObject(ItemData())
    }
}
