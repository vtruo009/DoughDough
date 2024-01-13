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
        HStack {
            Button {
                print("Done!")
            } label: {
                Image(systemName: "circle")
            }
            Text("\(item.title)")
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
