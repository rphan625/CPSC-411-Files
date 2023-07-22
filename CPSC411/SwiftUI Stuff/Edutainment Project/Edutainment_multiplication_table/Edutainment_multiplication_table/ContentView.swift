//
//  ContentView.swift
//  Edutainment_multiplication_table
//
//  Created by csuftitan on 11/25/22.
//

import SwiftUI

class Settings : ObservableObject {
    @Published var difficulty: Int = 2
    @Published var numOfQuestions: Int = 5
}

struct ContentView: View {
    @State private var showSecondScreen = false
    @StateObject var setting = Settings()
    @State private var questionCount = 1
    @State private var correctCount = 0
    @State private var gameRunning = true
    @State private var correctAnswer : Int = 0
    @State private var resultText : String = ""
    @State private var secondMultiples = [1,2,3,4,5,6,7,8,9,10,11,12]
    
    var body: some View {
        
        if gameRunning {
            let multiples = Array(2...setting.difficulty)
            var firstNum = multiples.randomElement() ?? 0
            var secondNum = secondMultiples.randomElement() ?? 0
            let correctAnswer = firstNum * secondNum
            let choices = [correctAnswer, correctAnswer + Int.random(in: 1...10), correctAnswer - Int.random(in: 1...10)].shuffled()
            NavigationView {
                VStack {
                    Section {
                        Text("Edutainment")
                            .font(.largeTitle)
                            .bold()
                        Text("Multiplication")
                            .font(.title)
                        Text("Difficulty: \(setting.difficulty)")
                            .font(.headline)
                        Text("Questions: \(setting.numOfQuestions)")
                            .font(.headline)
                        Spacer()
                    }
                    Section {
                        HStack {
                            Text("\(firstNum) X \(secondNum)")
                                .font(.largeTitle)
                        }
                        Spacer()
                        HStack {
                            Spacer()
                            Button("\(choices[0])") {
                                choices[0] == correctAnswer ? (resultText = "Correct") : (resultText = "Wrong")
                                choices[0] == correctAnswer ? (correctCount += 1) : (correctCount += 0)
                                firstNum = multiples.randomElement() ?? 0
                                secondNum = secondMultiples.randomElement() ?? 0
                                if questionCount >= setting.numOfQuestions {
                                    gameRunning = false
                                }
                                questionCount += 1
                            }
                                .font(.title)
                                .frame(width: 100, height: 100)
                                .background(.gray)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                            Spacer()
                            Button("\(choices[1])") {
                                choices[1] == correctAnswer ? (resultText = "Correct") : (resultText = "Wrong")
                                choices[1] == correctAnswer ? (correctCount += 1) : (correctCount += 0)
                                firstNum = multiples.randomElement() ?? 0
                                secondNum = secondMultiples.randomElement() ?? 0
                                if questionCount >= setting.numOfQuestions {
                                    gameRunning = false
                                }
                                questionCount += 1
                            }
                                .font(.title)
                                .frame(width: 100, height: 100)
                                .background(.gray)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                            Spacer()
                            Button("\(choices[2])") {
                                choices[2] == correctAnswer ? (resultText = "Correct") : (resultText = "Wrong")
                                choices[2] == correctAnswer ? (correctCount += 1) : (correctCount += 0)
                                firstNum = multiples.randomElement() ?? 0
                                secondNum = secondMultiples.randomElement() ?? 0
                                if questionCount >= setting.numOfQuestions {
                                    gameRunning = false
                                }
                                questionCount += 1
                            }
                                .font(.title)
                                .frame(width: 100, height: 100)
                                .background(.gray)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                            Spacer()
                            
                        }
                        Text("Result: \(resultText)")
                            .font(.headline)
                        Text("Questions Count \(questionCount)")
                        Text("Correct Count \(correctCount)")
                        Spacer()
                    }
                }
                .padding()
                .toolbar {
                    Button("Settings") {
                        showSecondScreen = true
                        print(multiples)
                    }
                    .sheet(isPresented: $showSecondScreen) {
                        SettingChangeView(setting: setting)
                    }
                }
            }
        } else {
            VStack {
                Spacer()
                Text("Game Over")
                    .font(.largeTitle)
                Spacer()
                Text("Results: \(correctCount) / \(setting.numOfQuestions)")
                    .font(.title)
                Spacer()
                Button("Restart") {
                    gameRunning = true
                    questionCount = 1
                    correctCount = 0
                }
                .font(.title)
                Spacer()
            }
        }
    }
}

func rerollNums(firstnum:Int, secondnum:Int) {
//    var firstNum : Int = firstnum
//    var secondNum : Int = secondnum
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
