//
//  ContentView.swift
//  HackingWithSwiftUIDay25
//
//  Created by csuftitan on 11/16/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var win = Bool.random()
    @State private var gameRunning = true
    @State private var opponentChoice = Int.random(in: 0..<3)
//    @State private var currentChoice = 0
    @State private var correctChoice = 0
    @State private var questionCount = 1
    @State private var correctCount = 0
    
    var choices = ["rock", "paper", "scissor"]
    
    var body: some View {
        if gameRunning {
            VStack {
                Text("Rock, Paper, Scissors")
                    .font(.largeTitle)
                Text("Objective: \(win == true ? "Win" : "Lose")")
                    .font(.title.bold())
                    .foregroundColor(win == true ? .blue : .red)
                Text("Opponent's Choice:")
                    .font(.title2)
                Spacer()
                Image(choices[opponentChoice])
                Spacer()
                HStack {
                    ForEach(0..<3) {number in
                        Button {
                            print("Selected \(number)")
                            
                            correctChoice = win == true ? ((opponentChoice + 1) % 3) : opponentChoice == 0 ? 2 : ((opponentChoice - 1) % 3)
                            print(win == true ? "Win" : "Lose")
                            print("Opponent's Choice: \(choices[opponentChoice])")
                            print("Correct answer is \(choices[correctChoice])")
                            if number == correctChoice {
                                correctCount += 1
                            } else {
                                correctCount -= 1
                            }
                            if questionCount == 10 {
                                gameRunning.toggle()
                            } else {
                                questionCount += 1
                            }
                            
                            win.toggle()
                            opponentChoice = Int.random(in: 0..<3)
                        } label: {
                            Text("\(choices[number])")
                                .font(.title)
                        }
                    }
                }
                Spacer()
                VStack {
                    Button("Objective Toggle") {
                        win.toggle()
                    }
                    Button("End Game") {
                        gameRunning.toggle()
                    }
                }
            }
        } else {
            VStack {
                Text("Game Over")
                    .font(.largeTitle)
                Text("Results:\nCorrect Answers: \(correctCount)/10")
                Button("Restart?") {
                    gameRunning.toggle()
                    questionCount = 1
                    correctCount = 0
                }
                    .foregroundColor(.blue)
                    .buttonStyle(.bordered)
                    .font(.title)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
