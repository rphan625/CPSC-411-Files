//=============================================//
// Problem 5: Write stack collection in Swift  //
//=============================================//

import SwiftUI

class Stack: CustomStringConvertible {
    private var stackArr = [Int]()
    private var size = 0
    
    public var description: String {
        if self.empty() { return "Stack is empty."}
        
        var str: String = ""
        
        for i in 0 ..< size {
            str += String(stackArr[size - (i + 1)])
            if i < size - 1 {
                str += String(" <--- ")
            }
        }
        
        return str
    }
    
    private func checkEmpty() {
        if self.empty() {
            fatalError("Empty stack found.")
        }
    }
    
    public func empty() -> Bool {
        return size == 0
    }
    
    public func pop() -> Void{
        self.checkEmpty()
        
        size -= 1
        stackArr.popLast()
    }
    
    public func top() -> Int? {
        self.checkEmpty()
        
        return stackArr.last
    }
    
    public func push(_ value: Int) {
        size += 1
        stackArr.append(value)
    }
}

var stack: Stack = Stack()

stack.push(1)
stack.push(10)
stack.push(100)

print(stack)

while !stack.empty() {
    stack.pop()
    print(stack)
}

print(stack)
