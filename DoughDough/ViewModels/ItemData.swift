//
//  ItemData.swift
//  DoughDough
//
//  Created by Van Truong on 1/7/24.
//

import Foundation

class ItemData: ObservableObject {
    @Published var testItems = Item.testItems
    
    func backlogItems() -> [Item] {
        return testItems.filter {
            $0.dateAssigned == nil
        }
    }
}
