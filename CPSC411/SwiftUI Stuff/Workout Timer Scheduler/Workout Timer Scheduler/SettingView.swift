//
//  SettingView.swift
//  Workout Timer Scheduler
//
//  Created by csuftitan on 12/5/22.
//

import SwiftUI

class settings: ObservableObject {
    var darkMode = true
    
}

struct SettingView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @ObservedObject var settingThings = settings()
    var body: some View {
//        VStack {
//            Toggle("Dark Mode", isOn: $settingThings.darkMode)
////            print(settingThings.darkMode)
//            Text("\(settingThings.darkMode ? "0" : "1")")
//        }
//        .preferredColorScheme(settingThings.darkMode ? .dark : .light)
        NavigationView {
            List {
                HStack {
                    Toggle("Dark Mode", isOn: $isDarkMode)
                }
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
