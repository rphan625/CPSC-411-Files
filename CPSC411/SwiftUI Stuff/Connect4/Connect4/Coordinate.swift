//
//  Coordinate.swift
//  Connect4
//
//  Created by csuftitan on 12/12/22.
//

import Foundation

struct Coordinate: Hashable {
    var x: Int = 0
    var y: Int = 0
    static var zero = Coordinate(x: 0, y: 0)
    
    static func == (lhs: Coordinate, rhs: Coordinate) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

extension Coordinate: CustomStringConvertible {
    var description: String {
        return "(\(x), \(y))"
    }
}
