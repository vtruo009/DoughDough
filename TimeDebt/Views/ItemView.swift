//
//  ItemView.swift
//  TimeDebt
//
//  Created by Van Truong on 1/11/24.
//

import SwiftUI

struct ItemView: View {
    var item: Item
    
    var body: some View {
        HStack(alignment: .top) {
            Button {
                print("Done!")
            } label: {
                Image(systemName: item.done ? "circle.inset.filled" : "circle")
            }
            VStack(alignment: .leading) {
                Text("\(item.title)")
                Text(item.notes)
                    .font(.footnote)
                    .foregroundColor(.gray)
                Text("\(item.timeToComplete) mins")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    @State static var testItem: Item = Item.testItems[0]
    static var previews: some View {
        ItemView(item: testItem)
    }
}
