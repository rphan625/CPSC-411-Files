//
//  FavoriteItemStore.swift
//  PhoneApp
//
//  Created by csuftitan on 10/17/22.
//

import UIKit

class FavoriteItemStore {
    var favoriteAllItems = [FavoriteItem]()
    
//    init() {
//        for _ in 0..<5 {
//            createItem()
//        }
//    }
    
    @discardableResult func createItem() -> FavoriteItem {
        let newItem = FavoriteItem(random: true)
//        NSLog("newItem", newItem)
        favoriteAllItems.append(newItem)
        return newItem
    }
    func removeItem(_ item: FavoriteItem) {
        if let index = favoriteAllItems.firstIndex(of: item) {
            favoriteAllItems.remove(at: index)
        }
    }
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        // Get reference to object being moved so you can reinsert it
        let movedItem = favoriteAllItems[fromIndex]
        // Remove item from array
        favoriteAllItems.remove(at: fromIndex)
        // Insert item in array at new location
        favoriteAllItems.insert(movedItem, at: toIndex)
    }
}
