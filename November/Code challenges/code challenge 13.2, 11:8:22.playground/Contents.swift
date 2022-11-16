import UIKit

var greeting = "Hello, playground"

func starWars(_ array: [Int]) -> Int {
    
    return array.sorted().dropFirst().dropLast().reduce(0, +)
}
starWars([1,4,6,7,2,4,3,6,36])
starWars([3,4,7,1,2,8])

