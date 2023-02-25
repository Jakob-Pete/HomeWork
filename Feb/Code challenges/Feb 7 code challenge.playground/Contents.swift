import UIKit

var greeting = "Hello, playground"
// find the LCM

func lcm(num1: Int, num2: Int) -> Int {
    var small = num1 < num2 ? num1 : num2
    var large = num1 > num2 ? num1 : num2
    for multi in 1...large {
        if small * multi % large == 0 {
            return small * multi
        }
    }
    return 0
}
lcm(num1: 9, num2: 18)
