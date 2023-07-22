//
//  SelectedVoicemailItem.swift
//  PhoneApp
//
//  Created by csuftitan on 10/29/22.
//

import UIKit

class SelectedVoicemailItems: Equatable {
    var selectedPhoneNumber:String = ""
    var date:String = ""
    var location:String = ""
    var time:String = ""
    
    init(selectedPhoneNumber:String, date:String, location:String, time:String) {
        self.selectedPhoneNumber = selectedPhoneNumber
        self.date = date
        self.location = location
        self.time = time
    }
    
    static func == (lhs: SelectedVoicemailItems, rhs: SelectedVoicemailItems) -> Bool {
        return (lhs.selectedPhoneNumber == rhs.selectedPhoneNumber) && (lhs.date == rhs.date) && (lhs.location == rhs.location) && (lhs.time == rhs.time)
    }
}
