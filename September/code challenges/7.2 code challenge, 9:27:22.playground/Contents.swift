import UIKit

var greeting = "Hello, playground"

func averageScore(_ scores: [Int]) -> Int {
    let sumArray = scores.reduce(0, +)
    let aveScore = sumArray / scores.count
    return aveScore
}



averageScore([98,90,76,80,87])


