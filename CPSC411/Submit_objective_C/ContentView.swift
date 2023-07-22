//
//  ContentView.swift
//  Submit
//
//  Created by William McCarthy on 27/8/2022.
//

import SwiftUI

struct ContentView: View {
  @State private var label = "tap the button"
  @State private var label_visible = false
  
  var body: some View {
    VStack {
      Button(action: {
        self.label = self.label_visible ? "tap the button" : "Button tapped"
        self.label_visible.toggle()
      }) {
        Text("Submit")
          .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
          .background(Color.yellow)
          .foregroundColor(Color.black)
          .border(Color.gray, width: 3)
          .font(Font.system(size: 26.0))
          .overlay(
            RoundedRectangle(cornerRadius: 10)
              .stroke(Color.gray, lineWidth: 5)
          )
      }
      Text(label)
        .padding()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
      ContentView()
              .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
              .previewDisplayName("iPhone 13 Pro Max")
              .previewInterfaceOrientation(.landscapeLeft)
      ContentView()
        .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        .previewDisplayName("iPhone 11")
    }
    
  }
}
