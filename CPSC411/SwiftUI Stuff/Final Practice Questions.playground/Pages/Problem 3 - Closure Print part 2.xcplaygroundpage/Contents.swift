//==================================================================================//
//  Problem 3: Write a Closure that prints the current value of its input variable  //
//==================================================================================//

import SwiftUI

var thing = "cars"

let closure = {
    print("I love \(thing)")
}

thing = "airplanes"
closure()

thing = "starships"
closure()
