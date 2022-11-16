import UIKit

var greeting = "Hello, playground"



func exponent(_ num: Int) -> [Int] {
    var powArray : [Int] = []
    
    for number in 0...num {
        powArray.append(Int(pow(Double(num), Double(number))))
    }
    return powArray
}
exponent(6)
