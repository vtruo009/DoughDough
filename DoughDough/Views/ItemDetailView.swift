//
//  ModifyItemView.swift
//  DoughDough
//
//  Created by Van Truong on 1/25/24.
//

import SwiftUI

struct ItemDetailView: View {
    let hourRange = 0...11
    let minuteRange = 0...59
    
    @Binding var item: Item
    
    var body: some View {
        Form {
            TextField("", text: $item.title)
            TextField("Notes", text: $item.notes)
            HStack(spacing: 0) {
                Text("Duration:")
                Picker("", selection: $item.duration.hour) {
                    ForEach(hourRange, id: \.self) { hour in
                        Text("\(hour)")
                    }
                }
                .pickerStyle(.wheel)
                Text("h")
                Picker("", selection: $item.duration.minute) {
                    ForEach(minuteRange, id: \.self) { minute in
                        Text("\(minute)")
                    }
                }
                .pickerStyle(.wheel)
                Text("m")
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
