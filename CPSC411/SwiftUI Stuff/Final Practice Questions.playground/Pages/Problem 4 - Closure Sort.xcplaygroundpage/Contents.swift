//===============================================//
//  Problem 4: Use Closures to sort collections  //
//===============================================//

import SwiftUI

let animals = ["Fish", "Cat", "Chicken", "Dog"]

var sortedAnimals = animals.sorted(by: <)
print(sortedAnimals)

sortedAnimals = animals.sorted {$0 > $1}
print(sortedAnimals)
