import UIKit

var greeting = "Hello, playground"

func funky(array: [Int]) -> Int {
    var number: Int = 0
    for numbers in array {
        number += numbers * numbers
        print(number)
    }
return number
}
funky(array: [1,2,2])



