import UIKit

var greeting = "Hello, playground"



//func countNums(nums: [Int]) -> [Int] {
//    var count = 0
//
//    for numbers in nums {
//        if numbers = 1...100 {
//            count += 1
//        } else if numbers == -1...-100 {
//            numbers + numbers
//        }
//    }
//
//
//    return
//}

func countNums(numbers: [Int]?) -> [Int]? {
    guard let numbers = numbers, numbers != [] else { return nil }
    
    var countPos = 0
    var sumNegative = 0
    
    for number in numbers {
        if number > 0 {
            countPos += 1
        } else {
            sumNegative += number
        }
    }
    return [countPos, sumNegative]
}
print(countNums(numbers: [1,2,3,4,5,6,7,8,9,10, -15,-50,-5]))
