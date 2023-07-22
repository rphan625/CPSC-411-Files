//
//  DisplayTimerView.swift
//  Workout Timer Scheduler
//
//  Created by csuftitan on 12/11/22.
//

import SwiftUI

struct DisplayTimerView: View {
//    @EnvironmentObject var timerlist: TimerList
//    @EnvironmentObject var timeritem: TimerItem
    @ObservedObject var timersetting: timerSettings
//    @State private var selectedRow: UUID? = nil
//    @State private var editMode: EditMode = .inactive
    var timeritem : TimerItem
//    var timerlist : TimerList
    var body: some View {
        NavigationView {
            VStack {
                SimpleTimerView(timersetting: timerSettings(seconds: Int(timeritem.seconds)))
            }
            .toolbar {
                NavigationLink(destination: EditTimerView()) {
                    Text("Edit")
                }
            }
        }
    }
}

struct DisplayTimerView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayTimerView(timersetting: timerSettings(), timeritem: TimerItem())
            .environmentObject(TimerItem())
    }
}
