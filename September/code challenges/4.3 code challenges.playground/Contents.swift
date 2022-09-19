import UIKit

var greeting = "Hello, playground"
//let a = [2, 2, 3]
//let b = [5, 4, 1]
//func math(a: [Int], b: [Int]) -> Int {
//    for num in array {
//        sqrt(Double(a))
//        sqrt(Double(b))
//    }
//
//}
func volumeOfACubiof(_ dimensions: [Int]) -> Int? {
    guard dimensions.count == 3 else {
        return nil
    }
    return dimensions[0] * dimensions[1] * dimensions[2]
//    return  dimensions.reduce(0, { x, y in x* y
//    })
}

func differenceInVolume(a: [Int], b: [Int]) -> Int? {
    if a.count != 3 || b.count != 3 {
        return nil
    }
    if let volA = volumeOfACubiof(a), let volB = volumeOfACubiof(b){
     return abs(volA - volB)
    }
    return nil
}
if let differenceInVolum = differenceInVolume(a: [2, 2, 3], b: [5, 4, 1]) {
print(differenceInVolum)
}
