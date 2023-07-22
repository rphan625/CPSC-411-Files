//
//  ContactsItem.swift
//  PhoneApp
//
//  Created by csuftitan on 10/24/22.
//

import UIKit

class ContactsItem: Equatable {
    var listName:String = ""
    var listContactCount:Int = 0
    
    init(listName:String, listContactCount:Int) {
        self.listName = listName
        self.listContactCount = listContactCount
    }
    
    static func == (lhs: ContactsItem, rhs: ContactsItem) -> Bool {
        return (lhs.listName == rhs.listName) && (lhs.listContactCount == rhs.listContactCount)
    }
}
