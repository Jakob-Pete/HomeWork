import UIKit

var greeting = "Hello, playground"

//    if ((n / x) == 1)  {
//        return true
//    } else { return false
//    }
//
//divisible(n: 100, x: 5, y: 3)
func divisible(n: Int, x: Int, y: Int) -> Bool {
    return n.isMultiple(of: x) && n.isMultiple(of: y)
    
    

}

divisible(n: 100, x: 5, y: 13)

divisible(n: 3, x: 1, y: 3)

