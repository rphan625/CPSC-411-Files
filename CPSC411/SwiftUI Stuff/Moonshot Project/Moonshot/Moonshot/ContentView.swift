//
//  ContentView.swift
//  Moonshot
//
//  Created by csuftitan on 11/30/22.
//

import SwiftUI

struct ContentView : View {
    @State private var showingGrid = true
    let astronauts : [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions : [Mission] = Bundle.main.decode("missions.json")
    
    
    var body: some View {
        NavigationView {
            Group {
                if showingGrid {
                    GridLayout()
                } else {
                    ListLayout()
                }
            }
            .navigationTitle("My Group")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button("Switch Layout") {
                    showingGrid.toggle()
                }
            }
            .foregroundColor(.primary)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
