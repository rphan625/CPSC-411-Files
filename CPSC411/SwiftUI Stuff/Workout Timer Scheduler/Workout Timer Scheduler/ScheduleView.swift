//
//  ScheduleView.swift
//  Workout Timer Scheduler
//
//  Created by csuftitan on 12/5/22.
//

import SwiftUI

struct ScheduleView: View {
    @State private var date = Date()
    var timerItem : TimerItem
    
    var body: some View {
        DatePicker(
            "Select Date",
            selection: $date,
            displayedComponents: [.date]
        )
        .datePickerStyle(.graphical)
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView(timerItem: TimerItem())
    }
}
