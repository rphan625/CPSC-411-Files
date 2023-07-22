//
//  Workout_Timer_SchedulerApp.swift
//  Workout Timer Scheduler
//
//  Created by csuftitan on 12/5/22.
//

import SwiftUI

@main
struct Workout_Timer_SchedulerApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
