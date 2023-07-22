//
//  ContentView.swift
//  TextField
//
//  Created by csuftitan on 11/8/22.
//

import SwiftUI


// TEXTFIELD

//struct ContentView: View {
//    @State private var firstName:String = ""
//    @State private var lastName:String = ""
//
//    func removeSpecialCharsFromString(text:String) -> String {
//        return text.components(separatedBy: CharacterSet.alphanumerics.inverted)
//            .joined()
//            .lowercased()
//    }
//
//    var body: some View {
//        VStack {
//            TextField("First Name", text: $firstName)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            TextField("Last Name", text: $lastName)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            Text("Your UserID: \(removeSpecialCharsFromString(text: (firstName + lastName)))")
//        }
//        .padding()
//        .font(.title)
//    }
//}

// SECUREFIELD

//struct ContentView: View {
//
//    @State var username: String = ""
//    @State var password: String = ""
//    private var enableButton: Bool {
//        !username.isEmpty && !password.isEmpty
//}
//    var body: some View {
//        Group {
//            HStack {
//                Text("Username").font(.title)
//                TextField("Username", text: $username).border(Color.black)
//            }
//            HStack {
//                Text("Password").font(.title)
//                TextField("Password", text: $password).border(Color.black)
//            }
//            Button("Login") {
//                print("Logging in using \(self.username) and \(self.password)")
//            }.disabled(!enableButton)
//        }.padding()
//            .font(.title)
//    }
//}

// TOGGLE

struct ContentView: View {
    @State private var showFavorites = true
    
    var body: some View {
        VStack {
            Toggle(isOn: $showFavorites) {
                Text("Show Favorites").bold()
            }.padding()
                .background(showFavorites ? Color.yellow : Color.gray)
                .labelsHidden()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
