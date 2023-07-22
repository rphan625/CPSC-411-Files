//=================================================================//
//  Problem 7: Write Python style exponent operator (**) for Ints  //
//=================================================================//

import SwiftUI

precedencegroup ExponentiativePrecedence {
    associativity: left
    higherThan: MultiplicationPrecedence
}

infix operator **: ExponentiativePrecedence

func **(lhs: Int, rhs: Int) -> Int {
    let l = Double(lhs);
    let r = Double(rhs);
    let p = pow(l, r);
    return Int(p);
}

print(2**2)
print(2**3)
print(2 * 3 ** 2)
