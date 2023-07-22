//
//  Fleet.swift
//  Battleship
//
//  Created by csuftitan on 12/11/22.
//

import Foundation

class Fleet {
    static let shipsInFleet:[(name: String, length: Int)] = [("Submarine", 3),
                                                            ("Destroyer", 2),
                                                            ("Cruiser", 3),
                                                            ("Battleship", 4),
                                                            ("Aircraft Carrier", 5)]
    var ships: [Ship]
    
    init() {
        ships = [Ship]()
    }
    
    func isDestroyed() -> Bool {
        return !ships.contains(where: {!$0.isSunk()})
    }
    
    func ship(at location: Coordinate) -> Ship? {
        return ships.first(where: {$0.occupies(location)})
    }
    
    func deploy(on ocean: Ocean) {
        ships.removeAll()
        for ship in Fleet.shipsInFleet {
            let fleetCoordinates = self.coordinates()
            let oceanCoordinates = ocean.locationsThatFit(length: ship.length)
            let possibleLocations = oceanCoordinates.filter {Set($0).intersection(fleetCoordinates).isEmpty}
            guard (possibleLocations.count > 0) else {
                assertionFailure("Cannot fit ship in ocean!")
                return
            }
            
            let randomIndex = Int.random(in: 0..<possibleLocations.count)
            let shipCoordinates = possibleLocations[randomIndex]
            let deployedShip = Ship(ship.name, coordinates: shipCoordinates)
            ships.append(deployedShip)
        }
    }
    
    private func coordinates() -> [Coordinate] {
        let coordinates = ships.map {$0.compartments.map {$0.location}}
        return Array(coordinates.joined())
    }
}
