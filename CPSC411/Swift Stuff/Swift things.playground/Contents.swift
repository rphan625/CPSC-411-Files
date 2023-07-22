import UIKit

//var greeting = "Hello, playground"

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

//let reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
//    return s1 > s2
//})
//

//let reversedNames = names.sorted(by: {s1, s2 in s1 > s2 })

//let reversedNames = names.sorted(by: { $0 > $1 })

let reversedNames = names.sorted(by: >)

print(reversedNames)
