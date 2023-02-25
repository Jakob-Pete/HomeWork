import UIKit

var greeting = "Hello, playground"
// You will be given an array a and a value x. All you need to do is check whether the provided array contains the value.

// The type of a and x can be String OR Int.

// Return true if the array contains the value, false if not.

//Take note of the wording of this problem. I should be able to pass in either an array of strings or an array of Ints and it will work the same.



func valueArray<T:Equatable>(a: [T], x: T) -> Bool {
//    if a.contains(x) {
//        return true
//
//    } else {
//        return false
//    }
//    return a.filter({$0 == x}).isEmpty ? true : false
    for t in a {
        if t == x {
            return true
        }
    }
    return false
}

valueArray(a: [1,2,3,4], x: 3)
