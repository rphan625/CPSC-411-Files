//
//  CreateTimerView.swift
//  Workout Timer Scheduler
//
//  Created by csuftitan on 12/8/22.
//

import SwiftUI

struct CreateTimerView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var timerlist: TimerList
    
    @State private var name = ""
    @State private var hours = 0
    @State private var minutes = 0
    @State private var seconds = 0
    
    var timeritem: TimerItem
    
    let chooseHours = Array(0...24)
    let chooseMinutes = Array(0...59)
    let chooseSeconds = Array(0...59)
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("Enter name for the timer", text: $name)
                    // MARK: PICKER WHEELS
                    HStack {
                        // MARK: HOURS PICKER WHEEL
                        VStack {
                            Picker("Hours", selection: $hours) {
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
                            .onAppear {
//                                hours = 1
                            }
                            
                            Text("Hours")
                        }
                        // MARK: MINUTES PICKER WHEEL
                        VStack {
                            Picker("Minutes", selection: $minutes) {
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
                            Picker("Seconds", selection: $seconds) {
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
                            .onAppear {
//                                seconds = timeritem.seconds
                            }
                            
                            Text("Seconds")
                        }
                    }
                }
            }
            .preferredColorScheme(.dark)
            .navigationTitle("Add New Timer")
            .toolbar {
                Button("Done") {
                    timerlist.timerItemList.append(TimerItem(name: name, seconds: Int(Int(seconds + (minutes * 60) + (hours * 3600)))))
                    print("Adding to the timer list!")
                    dismiss()
                }
            }
        }
    }
}

struct CreateTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTimerView(timeritem: TimerItem())
            .environmentObject(TimerList())
    }
}
