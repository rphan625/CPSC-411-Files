//
//  TimerItem.swift
//  Workout Timer Scheduler
//
//  Created by csuftitan on 12/8/22.
//

import Foundation

class TimerItem: Identifiable, ObservableObject {
    var id = UUID()
    var name: String
    var seconds: Int
    var date = Date().formatted(date: .abbreviated, time: .omitted)
    
    init() {
        self.name = "Default Name"
        self.seconds = 60
        self.date = Date().formatted(date: .abbreviated, time: .omitted)
    }
    
    init(name:String, seconds:Int) {
        self.name = name
        self.seconds = seconds
    }
}
