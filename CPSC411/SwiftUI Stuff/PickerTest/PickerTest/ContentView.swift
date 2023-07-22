//
//  ContentView.swift
//  PickerTest
//
//  Created by csuftitan on 12/12/22.
//

import SwiftUI

class timerStruct : ObservableObject {
    @Published var hours = 0
    @Published var minutes = 0
    @Published var seconds = 0
}

struct DisplayView: View {
    @EnvironmentObject var timer: timerStruct
    
    var body: some View {
        VStack {
            Text("Displayed Hours: \(timer.hours)")
            Text("Displayed Minutes: \(timer.minutes)")
            Text("Displayed Seconds: \(timer.seconds)")
        }
    }
}

struct ContentView: View {
    @StateObject var timer = timerStruct()
    
//    @State private var hours = 0
//    @State private var minutes = 0
//    @State private var seconds = 0
    
    let chooseHours = Array(0...24)
    let chooseMinutes = Array(0...59)
    let chooseSeconds = Array(0...59)
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hours: \(timer.hours)")
                Text("Minutes: \(timer.minutes)")
                Text("Seconds: \(timer.seconds)")
                HStack {
                    // MARK: HOURS PICKER WHEEL
                    VStack {
                        Picker("Hours", selection: $timer.hours) {
                            ForEach(chooseHours, id: \.self) {
                                Text("\($0)")
                                    .scaleEffect(x: 4)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(maxWidth: 50)
                        .compositingGroup()
                        .scaleEffect(x: 0.25)
                        .padding()
                        
                        Text("Hours")
                    }
                    // MARK: MINUTES PICKER WHEEL
                    VStack {
                        Picker("Minutes", selection: $timer.minutes) {
                            ForEach(chooseMinutes, id: \.self) {
                                Text("\($0)")
                                    .scaleEffect(x: 4)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(maxWidth: 50)
                        .compositingGroup()
                        .scaleEffect(x: 0.25)
                        .padding()
                        
                        Text("Minutes")
                    }
                    // MARK: SECONDS PICKER WHEEL
                    VStack {
                        Picker("Seconds", selection: $timer.seconds) {
                            ForEach(chooseSeconds, id: \.self) {
                                Text("\($0)")
                                    .scaleEffect(x: 4)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(maxWidth: 50)
                        .compositingGroup()
                        .scaleEffect(x: 0.25)
                        .padding()
                        
                        Text("Seconds")
                    }
                }
                
                Form {
                    NavigationLink {
                        DisplayView()
                            .environmentObject(timer)
                    } label: {
                        Text("Send")
                    }
                }
                
            }
            .padding()
        }
        .environmentObject(timer)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(timerStruct())
    }
}
