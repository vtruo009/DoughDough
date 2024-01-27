//
//  ModifyItemView.swift
//  DoughDough
//
//  Created by Van Truong on 1/25/24.
//

import SwiftUI

struct ItemDetailView: View {
    @Binding var item: Item
    
    var body: some View {
        Form {
            TextField("", text: $item.title)
            TextField("Notes", text: $item.notes)
            HStack {
                Text("Time to Complete:")
                TextField("minutes", value: $item.timeToComplete, format: .number)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numbersAndPunctuation)
            }
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    @State static var item: Item = Item()
    static var previews: some View {
        ItemDetailView(item: $item)
    }
}
