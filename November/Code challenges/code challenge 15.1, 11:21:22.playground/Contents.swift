import UIKit
import RegexBuilder
var greeting = "Hello, playground"


// Your task is to implement a function that calculates the sum of the integers inside a string. For example, in the string "The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog", the sum of the integers is 3635.

func sumOfIntegersInString(_ string: String) -> Int {
    var sum = 0
//     i need a func that goes through each charater of the string and add up all the numbers together but it also needs to add the whole number and not just one Int at a time
    var currentNumStr = ""
    for char in string {
        if char.isNumber {
            currentNumStr += "\(char)"
        } else {
            if let number = Int(currentNumStr) {
                sum += number
            }
            currentNumStr = ""
        }
    }
    return sum
}
sumOfIntegersInString("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog")
