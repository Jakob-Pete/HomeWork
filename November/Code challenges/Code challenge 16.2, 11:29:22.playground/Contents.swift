import UIKit

var greeting = "Hello, playground"


func binaryNum(binary:String) -> Int {
  let array = Array(binary)
    var result = 0
    
    
    for index in 0..<array.count {
        result += Int(pow(2, Double((array.count - 1) - index)) * Double(String(array[index]))!)
    }
    return result
}
binaryNum(binary: "10110")
