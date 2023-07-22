//
//  SelectedContactsListsItems.swift
//  PhoneApp
//
//  Created by csuftitan on 10/25/22.
//

import UIKit

class SelectedContactsListsItems: Equatable {
    var selectedContactsName:String = ""
    
    init(selectedContactsName:String) {
        self.selectedContactsName =  selectedContactsName
    }
    
    static func == (lhs: SelectedContactsListsItems, rhs: SelectedContactsListsItems) -> Bool {
        return lhs.selectedContactsName == rhs.selectedContactsName
    }
    
}
