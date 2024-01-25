//
//  ItemData.swift
//  DoughDough
//
//  Created by Van Truong on 1/7/24.
//

import Foundation

class ItemData: ObservableObject {
    @Published var testItems = Item.testItems
    
    func todayItems() -> [Item] {
        return testItems.filter {
            $0.dateAssigned != nil
        }
    }
    
    func backlogItems() -> [Item] {
        return testItems.filter {
            $0.dateAssigned == nil
        }
    }
    
    func index(of item: Item) -> Int? {
        print("item: \(item.id)")
        for i in testItems.indices {
            print("copy: \( testItems[i].id)")
            if testItems[i].id == item.id {
                return i
            }
        }
        return nil
    }
    
}
