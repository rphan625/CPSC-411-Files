//
//  Ship.swift
//  Battleship
//
//  Created by csuftitan on 12/11/22.
//

import Foundation


class Ship {
    var name: String
    var compartments: [ShipCompartment]
    var length: Int {return compartments.count}
    
    init(_ name: String, coordinates: [Coordinate]) {
        self.name = name
        self.compartments = [ShipCompartment]()
        for coordinate in coordinates {
            compartments.append(ShipCompartment(location: coordinate))
        }
    }
    
    func coordinates() -> [Coordinate] {
        return Array(compartments.map {$0.location})
    }
    
    func occupies(_ location: Coordinate) -> Bool
    {
        return compartments.contains(where:{$0.location == location})
    }
    
    func isSunk() -> Bool
    {
        return !compartments.contains(where: {!$0.flooded})
    }
    
    func hit(at location: Coordinate) {
        if let compartment = compartments.first(where: {$0.location == location}) {
            compartment.flooded = true
        }
    }
}

extension Ship: CustomStringConvertible {
    var description: String {
        return name + ": " + compartments.description
    }
}
