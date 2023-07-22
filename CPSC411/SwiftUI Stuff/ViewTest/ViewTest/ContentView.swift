//
//  ContentView.swift
//  ViewTest
//
//  Created by csuftitan on 11/28/22.
//

import SwiftUI

class UserProgress : ObservableObject {
    @Published var score = 0
    @Published var questions = 0
}

struct ContentView: View {
    @State private var showSecondScreen = false
    @StateObject var progress = UserProgress()
    var body: some View {
        NavigationView {
            VStack {
                Text("User Score: \(progress.score)")
                Text("Questions: \(progress.questions)")
            }
            .padding()
            .toolbar {
                Button("SecondView") {
                    showSecondScreen = true
                }
                .sheet(isPresented: $showSecondScreen) {
                    SettingChangeView(progress: progress)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(progress: UserProgress())
    }
}
