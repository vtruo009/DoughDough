//
//  ItemView.swift
//  DoughDough
//
//  Created by Van Truong on 1/11/24.
//

import SwiftUI

struct ItemView: View {
    @State var item: Item
    @State var isPresenting: Bool = false
    @EnvironmentObject private var itemData: ItemData
    
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
                Text(item.notes)
                    .font(.footnote)
                    .foregroundColor(.gray)
                Text("\(item.timeToComplete) mins")
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
                itemData.removeItem(item: item)
            }
            .tint(.red)
        }
        .swipeActions(edge: .leading) {
            Button("Move to Today") {
                print("Move to Today")
                itemData.moveToToday(item: item)
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
                                itemData.saveItems()
                            }
                        }
                    }
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: .init(
            title: "New item",
            timeToComplete: 40,
            notes: "This is a test note",
            date: nil
        ))
    }
}
