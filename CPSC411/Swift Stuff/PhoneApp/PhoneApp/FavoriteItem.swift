//
//  FavoriteItem.swift
//  PhoneApp
//
//  Created by csuftitan on 10/17/22.
//

import UIKit

class FavoriteItem: Equatable {
    var name: String
    var phoneType: String
    var initialLabel: String
    
    
    init(name: String, phoneType: String, initialLabel: String) {
        self.name = name
        self.phoneType = phoneType
        self.initialLabel = initialLabel
    }
    convenience init(random: Bool = false) {
        if random {
            let Names = ["Mom", "Dad", "Brother", "Sister", "Grandfather", "Grandmother"]
            let PhoneTypes = ["Mobile", "Work", "Phone"]
            let InitialIcon = [""]
            let randomName = Names.randomElement()!
            let randomPhoneType = PhoneTypes.randomElement()!

            self.init(name: randomName, phoneType: randomPhoneType, initialLabel: "")
        } else {
            self.init(name: "", phoneType: "", initialLabel: "")
        }
    }
    static func ==(lhs:FavoriteItem, rhs:FavoriteItem) -> Bool {
        return lhs.name == rhs.name && lhs.phoneType == rhs.phoneType
    }
}
