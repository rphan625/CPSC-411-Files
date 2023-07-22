//
//  ContentView.swift
//  Hello World
//
//  Created by csuftitan on 10/6/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image("weimenglee")
                .resizable()
                .frame(width: CGFloat(120),
                       height: CGFloat(120))
                .cornerRadius(CGFloat(15),
                    antialiased: true)
            VStack (alignment: .center){
                Text("Wei-Meng Lee")
                    .font(.largeTitle)
                    .bold()
                Text("Founder")
                Text("Developer Learning Solutions")
                    .italic()
                Button(action: {
                            if let url = URL(string:
                              "http://calendar.learn2develop.net") {
                                  UIApplication.shared.open(url)
                            }
                }) {
                    Text("http://calendar.learn2develop.net")
                }
                Button(action: {
                            if let url = URL(string:
                              "https://twitter.com/weimenglee") {
                                  UIApplication.shared.open(url)
                            }
                }) {
                         Text("@weimenglee")
                }
            }
        }.frame(maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iphone 8")
    }
}
