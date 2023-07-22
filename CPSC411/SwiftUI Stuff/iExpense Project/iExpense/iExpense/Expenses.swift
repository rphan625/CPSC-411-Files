//
//  Expenses.swift
//  iExpense
//
//  Created by csuftitan on 11/25/22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    @Published var businessItems = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(businessItems) {
                UserDefaults.standard.set(encoded, forKey: "BusinessItems")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                
                if let savedItems = UserDefaults.standard.data(forKey: "BusinessItems") {
                    if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                        businessItems = decodedItems
                        return
                    }
                }
                
                return
            }
        }
        
        
        items = []
        businessItems = []
    }
}
