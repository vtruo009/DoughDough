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
        for i in testItems.indices {
            if testItems[i].id == item.id {
                return i
            }
        }
        return nil
    }
    
    func addItem(item: Item) {
        testItems.append(item)
        saveItems()
    }
    
    func removeItem(item: Item) {
        guard let indx = index(of: item) else {
            print("Error: cannot find item to remove!")
            return
        }
        testItems.remove(at: indx)
        saveItems()
    }
    
    func moveToToday(item: Item) {
        guard let indx = index(of: item) else {
            print("Error: cannot find item to move to Today!")
            return
        }
        testItems[indx].dateAssigned = Date.now
        saveItems()
    }
    
    private var itemsFileURL: URL {
        do {
            let documentsDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            return documentsDirectory.appendingPathComponent("itemData")
        } catch {
            fatalError("An error occurred while getting the URL: \(error)")
        }
    }
    
    func saveItems() {
        do {
            let encodedData = try JSONEncoder().encode(testItems)
            try encodedData.write(to: itemsFileURL)
        } catch {
            fatalError("An error occurred while saving to do list: \(error)")
        }
    }
    
    func loadItems() {
        guard let decodedData = try? Data(contentsOf: itemsFileURL) else {
            return
        }
        do {
            let savedItems = try JSONDecoder().decode([Item].self, from: decodedData)
            testItems = savedItems
        } catch {
            fatalError("An error occurred while loading data: \(error)")
        }
    }
}
