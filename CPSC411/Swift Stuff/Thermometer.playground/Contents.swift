import UIKit

//var greeting = "Hello, playground"
//
//class Thermometer {
//    var areaName = ""
//    var temperature = 0
//
//    func register(name: String, temp: Int) {
//        areaName = name
//        temperature = temp
//    }
//
//    func description() {
//        print(areaName)
//        print(temperature)
//    }
//}
//
//print("Enter name of area\n")
//
//var nameArea = readLine()
//print(nameArea)
//
//print("Enter the temperature\n")
//
//var currentTemp = readLine()
//print(currentTemp)
//

//var temp = 139
////var stringTemp = String(temp)
////let index = stringTemp.index(stringTemp.endIndex, offsetBy: -1)
//
//print("+---+\n|\(temp)|")
//temp = 130
//while temp >= 30 {
//    print("+---+\n|\(temp)|")
//    temp -= 10
//}
//print("+---+")

//class stack {
//    init() {    starray = [Int]();        size = 0; }
//    public func empty() -> Bool { return size == 0; }
//    public func pop() -> Void {    checkEmpty();    size -= 1;    starray.popLast(); }
//    public func top() -> Int? {        checkEmpty();      return starray.last; }
//    public func push(_ value: Int) {    size += 1;        starray.append(value); }
//    public var description: String {
//        var s: String = "";
//        if (empty()) { return "stack is empty"; }
//        for i in 0..<size { s += String(starray[size - i - 1]);
//            if (i < size - 1) { s += " <--- "; }
//        }
//        return s;
//    }
//    private func checkEmpty() {
//        if (empty()) { fatalError("popping an empty stack"); }
//    }
//    private(set) var starray: [Int];
//    private(set) var size: Int;
//}
//
//var st: stack = stack();
//st.push(5);    st.push(10);    st.push(15);  st.push(39);  print(st.description);
//while (!st.empty()) { st.pop(); print(st.description); }
//print(st.description);

func divide(_ dividend: Double, by divisor: Double) -> Double? {
    return divisor == 0 ? .none : dividend / divisor;
}
let a = 3.0, b = 0.0;
let a_over_b = divide(a, by: b);
let b_over_a = divide(b, by: a);
print(String(format: "%.1f / %.1f = %.1f", a, b,
    (a_over_b == nil ? Double.nan : a_over_b!)));
print(String(format: "%.1f / %.1f = %.1f", b, a,
    (b_over_a == nil ? Double.nan : b_over_a!)));



