//
//  EditTimerView.swift
//  Workout Timer Scheduler
//
//  Created by csuftitan on 12/11/22.
//

import SwiftUI

struct EditTimerView: View {
    @EnvironmentObject var timeritem : TimerItem
    var body: some View {
        VStack {
            Text("\(timeritem.name)")
            Text("\(timeritem.seconds)")
                

        }
    }
}

struct EditTimerView_Previews: PreviewProvider {
    static var previews: some View {
        EditTimerView()
            .environmentObject(TimerItem())
    }
}
