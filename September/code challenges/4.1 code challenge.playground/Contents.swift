import UIKit

var greeting = "Hello, playground"
func stringy(size: Int) -> String {
  var work = true
    var string = ""

    for _ in 0..<size {
        string += work ? "1" : "0"
        work.toggle()
    }
    return string

}
stringy(size: 12)

//let answer = "10101010101010101010101010101010"
//print(answer.prefix(12))
//func stringy(size: Int) -> String {
//    let block = "10"
//    let halfSize = size / 2
//    var resultString = ""
//
//    for _ in 0..<halfSize {
//        resultString+=block
//    }
//
//    return resultString
//}
//stringy(size: 6)
