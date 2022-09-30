import UIKit

var greeting = "Hello, playground"

func moneyTalks(amount: Double) -> String {
    return String(format: "$%.2f", amount)
    
}
moneyTalks(amount: 53.16)

// slightly different way to do it below
//func moneyTalks(amount: Float) -> String {
//    return String(format: "$%.02f", amount)
//
//}
//moneyTalks(amount: 9.3)
