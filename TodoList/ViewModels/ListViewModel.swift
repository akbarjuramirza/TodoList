//
//  ListViewModel.swift
//  TodoList
//
//  Created by Akbarjon Juramirzaev on 09/08/23.
//

import Foundation

/*
 CRUD FUNCTIONS
 
 Create
 Read
 Update
 Delete
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItem()
    }
    
    // Function to get items and append to items array
    func getItem() {
        let newItems = [
            ItemModel(title: "Title 1", isCompleted: false),
            ItemModel(title: "Title 2", isCompleted: true),
            ItemModel(title: "Title 3", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    // Function to delete items from the List
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    // Function to add items into List
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    // Function to move the items in the List
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    // Function to update the item
    func updateItem(item: ItemModel) {
//        if let index = items.firstIndex { existingItem in
//            return existingItem.id == item.id
//        } {
//            // run this code
//        }
        if let index = items.firstIndex(where: { $0.id == item.id }) {
//            items[index] = ItemModel(title: item.title, isCompleted: !item.isCompleted)
            items[index] = item.updateCompletion()
        }
        
    }
}
