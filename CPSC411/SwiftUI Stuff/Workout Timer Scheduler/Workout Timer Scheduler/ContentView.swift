//
//  ContentView.swift
//  Workout Timer Scheduler
//
//  Created by csuftitan on 12/5/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SimpleTimerView(timersetting: timerSettings())
                .tabItem {
                    Label("Timer", systemImage: "clock")
                }
                .environmentObject(timerSettings())
            TimerPlaylistView()
                .tabItem {
                    Label("Timer Playlist", systemImage:  "list.dash")
                }
                .environmentObject(TimerList())
            ScheduleView(timerItem: TimerItem())
                .tabItem {
                    Label("Schedule", systemImage: "calendar")
                }
            SettingView()
                .tabItem {
                    Label("Setting", systemImage: "gearshape")
                }
        }
//        .statusBarHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
