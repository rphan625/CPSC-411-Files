//
//  ContentView.swift
//  ToggleSwiftUI
//
//  Created by csuftitan on 11/8/22.
//

import SwiftUI

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
