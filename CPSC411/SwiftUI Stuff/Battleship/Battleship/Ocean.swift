//
//  Ocean.swift
//  Battleship
//
//  Created by csuftitan on 12/11/22.
//

import Foundation

struct Ocean {
    var numCols: Int
    var numRows: Int
    private var origin: Coordinate = .zero
    
    init(numCols: Int, numRows: Int) {
        self.numCols = numCols
        self.numRows = numRows
    }
    
    func contains(_ point: Coordinate) -> Bool
    {
        return(point.x >= origin.x && point.y >= origin.y && point.x < numCols && point.y < numRows)
    }
    
    func contains(_ points: Array<Coordinate>) -> Bool
    {
        return !points.contains(where:{!self.contains($0)})
    }
    
    func locationsThatFit(length: Int) -> [[Coordinate]] {
        var locations = [[Coordinate]]()
        
        for y in 0..<numRows {
            for start in 0...(numCols - length) {
                var span = [Coordinate]()
                for x in start..<(start + length) {
                    span.append(Coordinate(x: x, y: y))
                }
                locations.append(span)
            }
        }
        
        for x in 0..<numCols {
            for start in 0...(numRows - length) {
                var span = [Coordinate]()
                for y in start..<(start + length) {
                    span.append(Coordinate(x: x, y: y))
                }
                locations.append(span)
            }
        }
        return locations
    }
}
