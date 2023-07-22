//
//  ToolbarView.swift
//  Battleship
//
//  Created by csuftitan on 12/11/22.
//

import SwiftUI

struct ToolbarView: View {
    @EnvironmentObject var game: Game
    
    
    var body: some View {
        HStack {
            Button(action: reset) { Image(systemName: "repeat")}
                .help("Start a new game.")
                .foregroundColor(.accentColor)
                .padding(.leading, 10)
            Spacer()
            Text(game.message)
            Spacer()
        }
        .frame(height: 30)
    }
    
    func reset() {
        game.reset()
    }
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView()
            .environmentObject(Game())
    }
}
