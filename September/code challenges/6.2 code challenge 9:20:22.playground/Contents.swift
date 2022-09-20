import UIKit

var greeting = "Hello, playground"
func returnEvenNum(num: Int) -> Int {
    let nEvenNum = (num - 1) * 2
    return nEvenNum
}
returnEvenNum(num: 3)
returnEvenNum(num: 100)


//func double(positioin: Int) -> Int {
//    var int = 0
//    
//    for _ in 1..<positioin {
//        int += 2
//    }
//    return int
//}
//double(positioin: 8)
//print(double(positioin: 3.dump))
