import UIKit

var greeting = "Hello, playground"
func yeet(array: [Int]) {
    for number in array {
        if number % 1 == 0 {
            number * number
        } else if number.isMultiple(of: 2) {
        sqrt(Double(number))
            }
        }
    }
yeet(array: [4,3,1])


func oddEven(ary: [Int]) -> [Int] {
    var newAry = ary
    for index in 0..<ary.count {
        let num = sqrt(Double(ary[index])).truncatingRemainder(dividingBy: 1)
        if num == 0.0 {
            newAry[index] = Int(sqrt(Double(newAry[index])))
        } else { newAry[index] == newAry[index]}
    }
    return newAry
}
oddEven(ary: [3,4,9,7,6,89])
