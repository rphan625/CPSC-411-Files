//
//  ContentView.swift
//  helloworldSwiftUI
//
//  Created by csuftitan on 8/29/22.
//

import SwiftUI

struct ContentView: View {
    @State private var label = "Tap the button"
    var body: some View {
        VStack{
            Button(action: {
                self.label = "Button tapped"
            }) {
                Text("Submit")
                    .padding(EdgeInsets(
                        top: 10, leading: 10,
                        bottom: 10, trailing: 10))
                    .background(Color.yellow)
                    .foregroundColor(Color.black)
                    .border(Color.gray, width: 3)
                    .font(Font.system(size:26.0))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray,
                                    lineWidth: 5)
                    )
            }
            Text(label)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
