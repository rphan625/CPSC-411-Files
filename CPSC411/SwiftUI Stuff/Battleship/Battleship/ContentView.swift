//
//  ContentView.swift
//  Battleship
//
//  Created by csuftitan on 12/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            ToolbarView()
            OceanView()
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
