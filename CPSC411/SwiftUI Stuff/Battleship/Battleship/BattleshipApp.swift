//
//  BattleshipApp.swift
//  Battleship
//
//  Created by csuftitan on 12/11/22.
//

import SwiftUI

@main
struct BattleshipApp: App {
    @StateObject private var game = Game()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(game)
        }
    }
}
