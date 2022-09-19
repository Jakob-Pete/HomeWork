import UIKit

var greeting = "Hello, playground"

//func addNum(arrays: [Int]) -> Int {
//    if ((arrays % 2) != 0) {
//        arrays.reduce(0, +)
//    }
//}
let numbers = [1,-4,7,12]
func numbSum(arr: [Int]) -> Int {
    var returnNum = 0
    for num in arr {
        if num > 0 {
        returnNum += num
        }
    }
    return returnNum
}
numbSum(arr: [1,-4,7,12])



func funReduce(arr: [Int]) -> Int {
    return arr.reduce(0)  { partialResult, nextNum in return partialResult + (nextNum > 0 ? nextNum :0)
    }
}
//return arr.reduce(0) { $0 + ($1 > 0 ? $1
