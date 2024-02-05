//
//  ItemView.swift
//  DoughDough
//
//  Created by Van Truong on 1/11/24.
//

import SwiftUI

struct ItemView: View {
    @Binding var item: Item
    @State var isPresenting: Bool = false
    @EnvironmentObject private var itemData: ItemData
    @State var viewStyle: ItemListView.ViewStyle
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Button {
                item.isDone.toggle()
            } label: {
                Image(systemName: item.isDone ? "circle.inset.filled" : "circle")
            }
            VStack(alignment: .leading) {
                Text("\(item.title)")
                    .font(.body)
                    .strikethrough(item.isDone)
                    .foregroundColor(item.isDone ? Color.gray : Color.black)
                if !item.notes.isEmpty {
                    Text(item.notes)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                Text(item.formattedDuration)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button {
                print("Display ItemDetailsView")
                isPresenting = true
            } label: {
                Image(systemName: "info.circle")
            }
            .padding(.trailing, 15)
        }
        .buttonStyle(BorderlessButtonStyle())
        .swipeActions(edge: .trailing) {
            Button("Delete") {
                print("Deleted item!")
                itemData.deleteItem(item: item)
            }
            .tint(.red)
        }
        .swipeActions(edge: .leading) {
            Button("\(viewStyle == ItemListView.ViewStyle.backlog ? "Assign" : "Unassign")") {
                print("moved item to \(viewStyle.rawValue)")
                itemData.moveItem(item: item)
            }
            .tint(.blue)
        }
        .sheet(isPresented: $isPresenting) {
            NavigationStack {
                ItemDetailView(item: $item)
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
                                isPresenting = false
                            }
                        }
                    }
            }
            .onDisappear { itemData.saveItems() }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    @State static var item: Item = Item(title: "New item",
                                 timeToComplete: TimeToComplete(hour: 0, minute: 40),
                                 notes: "",
                                 date: nil)
    static var previews: some View {
        ItemView(item: $item, viewStyle: ItemListView.ViewStyle.backlog)
    }
}
