//
//  PickerTestApp.swift
//  PickerTest
//
//  Created by csuftitan on 12/12/22.
//

import SwiftUI

@main
struct PickerTestApp: App {
    @EnvironmentObject var timer : timerStruct
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(timer)
        }
    }
}
