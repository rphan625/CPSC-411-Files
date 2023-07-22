//=======================================================================================================//
//  Problem 2: Write a Closure that ONLY prints the value of its input variable the time it was created  //
//=======================================================================================================//

import SwiftUI

var thing: String = "Cars"

let Closure = { [thing] in
    print ("I love \(thing)")
}

thing = "airplanes"
Closure()

thing = "starships"
Closure()
