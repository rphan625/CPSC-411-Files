//
//  ContentView.swift
//  pickerDataTransfer
//
//  Created by csuftitan on 12/7/22.
//

import SwiftUI

class GameSetting : ObservableObject {
    @Published var firstNum = 0
    @Published var secondNum = 0
}

struct SecondView: View {
    @EnvironmentObject var settings: GameSetting
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("First Num: \(settings.firstNum)")
                .onReceive(timer) { _ in
                    if settings.firstNum > 0 {
                        settings.firstNum -= 1
                    }
                }
            Text("Second Num: \(settings.secondNum)")
        }
    }
}

struct ContentView: View {
    @StateObject var settings = GameSetting()
    let firstWheel = Array<Int>(0...10)
    let secondWheel = Array<Int>(0...10)
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    
                    Picker("First", selection: $settings.firstNum) {
                        ForEach(firstWheel, id: \.self) {
                            Text("\($0)")
                                .scaleEffect(x: 3)
                        }
                    }
                    .compositingGroup()
                    .scaleEffect(x: 0.333)
                    .pickerStyle(.wheel)
                    
                    Spacer()
                    
                    Picker("Second", selection: $settings.secondNum) {
                        ForEach(secondWheel, id: \.self) {
                            Text("\($0)")
                                .scaleEffect(x: 3)
                        }
                    }
                    .compositingGroup()
                    .scaleEffect(x: 0.333)
                    .pickerStyle(.wheel)
                    
                    Spacer()
                }
                NavigationLink {
                    SecondView()
                } label: {
                    Text("Show Second View")
                }
                    
            }
        }
        .environmentObject(settings)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
