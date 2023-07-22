//
//  SettingChangeView.swift
//  ViewTest
//
//  Created by csuftitan on 11/28/22.
//

import SwiftUI

struct SettingChangeView: View {
    @ObservedObject var progress: UserProgress
    @Environment(\.dismiss) var dismiss
    let numQuestions = [5, 10, 15, 20]
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Update Score") {
                    progress.score += 1
                }
                Picker("", selection: $progress.questions) {
                    ForEach(numQuestions, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            .toolbar {
                Button("Done") {
                    dismiss()
                }
            }
        }
    }
}

struct SettingChangeView_Previews: PreviewProvider {
    static var previews: some View {
        SettingChangeView(progress: UserProgress())
    }
}
