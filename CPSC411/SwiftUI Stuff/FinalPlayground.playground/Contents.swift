import UIKit

//NSNumber* aNumber = [NSNumber numberWithInteger:999];
//NSLog(@"%@", aNumber);

//NSLog("@this is a string");

//class Star {
//    class func spin() {}
//    class func illuminate() {}
//}
//
//class Sun : Star {
//    override class func spin() { super.spin(); }
//    override static func illuminate() { super.illuminate(); }
//}

//class Star {
//    class func spin() {}
//    class final func illuminate() {}
//}
//
//class Sun : Star {
//    override class func spin() { super.spin(); }
//    override static func illuminate() { super.illuminate(); }
//}
//
//var x = Optional(5)
//
//print(x!)

//// TODO: WRITE the CODE using a closure that uses just <
//var politicians = ["kamala", "hillary", "karen", "nancy"];
//let sorted3 = politicians.sorted(by:<);
//print("sorted3 is \(sorted3)")
//

func divide(_ dividend: Double, by divisor: Double) -> Double? {
    return divisor == 0 ? .none : dividend / divisor;
}

func divideAsString(_ a: Double, by b: Double) -> String {
  let result = divide(a, by: b)
    return(String(format: "%.1f/%.1f = %.1f", a, b, (result == nil ? Double.nan : result!)))
}
let a = 3.0, b = 0.0;
print(divideAsString(a, by: b));
print(divideAsString(b, by: a));
