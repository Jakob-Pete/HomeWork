import UIKit

var greeting = "Hello, playground"


func sumOfAll(_ n: Int, _ m: Int) -> Int? {
    guard n >= 0,  m >= 0 else { return nil }
//    need to go through all numbers between n-m and then add them up by n
    var total = 0
    
    var runnningMultiple = n
    
    while runnningMultiple < m {
        
        total += runnningMultiple
        runnningMultiple += n
        
    }
//
//    for num in n..<m {
//        num.isMultiple(of: n)
//        number = num + num
//    }
    return total
}
sumOfAll(2, 9)
sumOfAll(3, 100)
sumOfAll(3, 9)

