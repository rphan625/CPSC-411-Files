//
//  RecentItem.swift
//  PhoneApp
//
//  Created by csuftitan on 10/22/22.
//

import UIKit

class RecentItem: Equatable {
    
    var name: String
    var phoneType: String
    var timeLabel: String
    var phoneImage: String
    
    init(name: String, phoneType: String, timeLabel: String, phoneImage: String) {
        self.name = name
        self.phoneType = phoneType
        self.timeLabel = timeLabel
        self.phoneImage = phoneImage
    }
    static func == (lhs: RecentItem, rhs: RecentItem) -> Bool {
        return lhs.name == rhs.name && lhs.phoneType == rhs.phoneType && lhs.timeLabel == rhs.timeLabel && lhs.phoneImage == rhs.phoneImage
    }
}
