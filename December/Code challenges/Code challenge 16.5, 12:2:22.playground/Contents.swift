import UIKit

var greeting = "Hello, playground"
// Your task is to sum the differences between consecutive pairs in the array in descending order.

// Example
// [2, 1, 10]  -->  9
// In descending order: [10, 2, 1]

// Sum: (10 - 2) + (2 - 1) = 8 + 1 = 9

// If the array is empty or the array has only one element the result should be 0

func doubleDown(_ arr: [Int]) -> Int {
    if arr.count < 2 {
        return 0
    }
    
    let arr = arr.sorted(by: >)
    var result = 0
    
    for index in 0..<(arr.count - 1) {
        result += (arr[index] - arr[index + 1])
    }
    return result
}
doubleDown([2,1,10])
doubleDown([5,2,7,57,76,14])
