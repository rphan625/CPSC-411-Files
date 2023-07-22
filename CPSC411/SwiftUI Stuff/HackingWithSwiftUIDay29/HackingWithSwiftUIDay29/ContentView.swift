//
//  ContentView.swift
//  HackingWithSwiftUIDay29
//
//  Created by csuftitan on 11/20/22.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        Text("Hello world")
    }
    
    func test() {
//        let input = "a b c"
//        let letters = input.components(separatedBy: " ") // can also use "\n"
//        let letter = letters.randomElement() ?? "a" // randomElement() returns a Optional Element
//
//        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = misspelledRange.location == NSNotFound
    }
}

// Loading resources from your app bundle

//struct ContentView: View {
//    var body: some View {
//        Text("HellO")
//    }
//
//    func loadFile() {
//        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
//            if let fileContents = try? String(contentsOf: fileURL) {
//                //we loaded file into string
////                fileContents // this acts as a normal string now
//            }
//        }
//    }
//}

// Introducing List, your best friend

//struct ContentView: View {
//    let people = ["Finn", "Leia", "Luke", "Rey"]
//
//    var body: some View {
//        List {
//            Text("Static row")
//
//            ForEach(people, id: \.self) {
//                Text($0)
//            }
//
//            Text("Static row")
//        }
//        .listStyle(.grouped)
//
////        List(people, id: \.self) {
////            Text($0)
////        }
////        .listStyle(.grouped)
////        List {
////            Section("Section 1") {
////                Text("Static row 1")
////                Text("Static row 2")
////            }
////
////            Section("Section 2") {
////                ForEach(0..<5) {
////                    Text("Dynamic row \($0)")
////                }
////            }
////
////            Section("Section 3") {
////                Text("Static row 3")
////                Text("Static row 4")
////            }
////
////        }
////        .listStyle(.grouped)
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
