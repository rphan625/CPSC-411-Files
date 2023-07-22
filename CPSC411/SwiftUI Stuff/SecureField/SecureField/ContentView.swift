//
//  ContentView.swift
//  SecureField
//
//  Created by csuftitan on 11/8/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    private var enableButton: Bool {
        !username.isEmpty && !password.isEmpty
}
    var body: some View {
        Group {
            HStack {
                Text("Username").font(.title)
                TextField("Username", text: $username).border(Color.black)
            }
            HStack {
                Text("Password").font(.title)
                TextField("Password", text: $password).border(Color.black)
            }
            Button("Login") {
                print("Logging in using \(self.username) and \(self.password)")
            }.disabled(!enableButton)
        }.padding()
            .font(.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
