//===================================================================================//
//  Problem 6: Write an Array extension that counts the unique elements in an array  //
//===================================================================================//

import SwiftUI

extension Array where Element: Comparable {
    func countUniques() -> Int {
        let arrSort = sorted(by: <)
        let initial: (Element?, Int) = (.none, 0);
        let reduced = arrSort.reduce(initial) {
            ($1, $0.0 == $1 ? $0.1 : $0.1 + 1)
        }
        
        return reduced.1
    }
}

let arr = [1, 2, 1, 2, 3, 1, 3, 1, 2, 1, 4]

print(arr.count)
print(arr.countUniques())
