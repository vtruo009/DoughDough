//
//  ItemView.swift
//  DoughDough
//
//  Created by Van Truong on 1/11/24.
//

import SwiftUI

struct ItemView: View {
    @State var item: Item
//    var itemData: ItemData = ItemData()
    
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
            } label: {
                Image(systemName: "info.circle")
            }
            .padding(.trailing, 15)
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}

struct ItemView_Previews: PreviewProvider {
//    @State static var testItem: Item = Item.testItems[0]
    static var previews: some View {
        ItemView(item: .init(
            title: "New item",
            timeToComplete: 40,
            notes: "This is a test note",
            date: nil
        ))
    }
}
