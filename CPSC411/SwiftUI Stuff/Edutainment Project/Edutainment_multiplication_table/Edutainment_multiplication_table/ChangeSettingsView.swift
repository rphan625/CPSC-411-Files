//
//  ChangeSettingsView.swift
//  Edutainment_multiplication_table
//
//  Created by csuftitan on 11/29/22.
//

import SwiftUI

struct SettingChangeView: View {
    @ObservedObject var setting: Settings
    @Environment(\.dismiss) var dismiss
    let numQuestions = [5, 10, 15, 20]
    
    var body: some View {
        NavigationView {
            Form {
//                Button("Update Score") {
//                    setting.difficulty += 1
//                }
                Section {
                    Stepper("Up to \(setting.difficulty)", value: $setting.difficulty, in: 2...12)
                } header: {
                    Text("Difficulty:")
                }
                Section {
                    Picker("", selection: $setting.numOfQuestions) {
                        ForEach(numQuestions, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Number of Questions:")
                }
            }
            .toolbar {
                Button("Done") {
                    dismiss()
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct ChangeSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingChangeView(setting: Settings())
    }
}
