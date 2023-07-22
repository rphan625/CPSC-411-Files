//
//  VoicemailItem.swift
//  PhoneApp
//
//  Created by csuftitan on 10/28/22.
//

import UIKit

class VoicemailItem: Equatable {
    var listName:String = ""
    
    init(listName:String) {
        self.listName = listName
    }
    
    static func == (lhs: VoicemailItem, rhs: VoicemailItem) -> Bool {
        return (lhs.listName == rhs.listName)
    }
}
