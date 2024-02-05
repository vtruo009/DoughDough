//
//  BacklogView.swift
//  DoughDough
//
//  Created by Van Truong on 1/16/24.
//

import SwiftUI

struct ItemListView: View {
    @EnvironmentObject var itemData: ItemData
    @State private var isPresenting: Bool = false
    @State private var newItem: Item = Item()
    @State var percentCompleted = 64.0
    var viewStyle: ViewStyle
    
    var body: some View {
        @State var itemStats = itemData.calculateItemStats()
        
        NavigationStack {
            if viewStyle == .today {
                InfoSectionView(totalTime: $itemStats.duration, percentage: $itemStats.percentage)
            }
            List {
                ForEach(items, id: \.self.id) { item in
                    ItemView(item: binding(item: item), viewStyle: viewStyle)
                }
            }
            .listStyle(PlainListStyle())
            .background(.white)
            .scrollContentBackground(.hidden)
            .navigationTitle(viewStyle.rawValue)
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
                                Button("Done") {
                                    if case .today = viewStyle {
                                        newItem.dateAssigned = Date.now
                                    }
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

extension ItemListView {
    enum ViewStyle: String {
        case backlog = "Backlog"
        case today = "Today"
    }
    
    private var items: [Item] {
        switch viewStyle {
            case .backlog:
                return itemData.backlogItems()
            case .today:
                return itemData.todayItems()
        }
    }
    
    func binding(item: Item) -> Binding<Item> {
        guard let indx = itemData.index(of: item) else {
            fatalError("Item not found")
        }
        return $itemData.testItems[indx]
    }
    
//    var itemStats: (Duration, Double) {
//        itemData.calculateItemStats()
//    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(viewStyle: .backlog).environmentObject(ItemData())
    }
}
