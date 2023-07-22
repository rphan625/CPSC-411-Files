//
//  ExpenseItem.swift
//  iExpense
//
//  Created by csuftitan on 11/25/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable { // Identifiable requires some sort of id, which is below
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
