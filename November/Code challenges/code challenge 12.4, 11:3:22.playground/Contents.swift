import UIKit

var greeting = "Hello, playground"

//func trying(_ base: [Int], _ baseTwo: [Int]) -> [Int] {
//    base.isMultiple(of: baseTwo)
//}



func multiples(of num: Int, limit: Int) -> [Int] {
    var multiples: [Int] = []
    
    for numb in num...limit {
        if numb % num == 0 {
            multiples.append(numb)
        }
    }
    return multiples
}
multiples(of: 3, limit: 15)
