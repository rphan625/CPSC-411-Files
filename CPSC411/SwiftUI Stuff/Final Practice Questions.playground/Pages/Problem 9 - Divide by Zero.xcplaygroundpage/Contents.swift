//======================================================================================//
//  Problem 9: Write a divide function that handles division by zero (using optionals)  //
//--------------------------------------------------------------------------------------//
//  Create a Swift class called nutrition that requires basic food information to be    //
//  specified when constructed ('calories carbohydrates fat'), but allows additional    //
//  (optional) values to be specified                                                   //
//======================================================================================//

import SwiftUI

func divide(_ dividend: Double, by divisor: Double) -> Double? {
    return divisor == 0 ? .none : dividend / divisor
}

let a = 3.0, b = 0.0
let aOverB = divide(a, by: b)
let bOverA = divide(b, by: a)

print(String(format: "%.1f / %.1f = %.1f", a, b, (aOverB == nil ? Double.nan : aOverB!)))
print(String(format: "%.1f / %.1f = %.1f", b, a, (bOverA == nil ? Double.nan : bOverA!)))
