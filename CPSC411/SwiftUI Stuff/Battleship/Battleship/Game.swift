//
//  Game.swift
//  Battleship
//
//  Created by csuftitan on 12/11/22.
//

import Foundation
import Combine

final class Game: ObservableObject {
    static let numCols = 10
    static let numRows = 10
    var ocean: Ocean
    var fleet: Fleet
    @Published var zoneStates = [[OceanZoneState]]()
    @Published var message = ""
    var over: Bool {return fleet.isDestroyed()}
    
    init() {
        self.ocean = Ocean(numCols: Game.numCols, numRows: Game.numRows)
        self.fleet = Fleet()
        reset()
    }
    
    func reset() {
        self.zoneStates = defaultZoneStates()
        self.fleet.deploy(on: self.ocean)
        self.message = ""
    }
    
    func zoneTapped(_ location: Coordinate) {
        if ((zoneStates[location.x][location.y] != .clear) || over) {
            return
        }
        
        if let hitShip = fleet.ship(at: location) {
            hitShip.hit(at: location)
            zoneStates[location.x][location.y] = .hit
            message = hitShip.isSunk() ? "You sunk my \(hitShip.name)!" : "Hit"
        } else {
            zoneStates[location.x][location.y] = .miss
            message = "Miss"
        }
        
        if (over) {
            message += " YOU WIN!"
        }
    }
    
    private func defaultZoneStates() -> [[OceanZoneState]] {
        var states = [[OceanZoneState]]()
        for x in 0..<Game.numCols {
            states.append([])
            for _ in 0..<Game.numRows {
                states[x].append(.clear)
            }
        }
        return states
    }
}
