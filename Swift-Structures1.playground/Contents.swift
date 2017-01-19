//: Playground - noun: a place where people can play

import UIKit

/*
 Structures are value types. By default, the properties of a value type cannot be modified from within its instance methods.
 
 However, you can optionally allow such modification to occur by declaring the instance methods as ‘mutating’; e.g.:
 */
struct IntStack {
    var items = [Int]()
    mutating func add(x: Int) {
        items.append(x) // All good!
    }
}
