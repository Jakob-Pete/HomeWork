import UIKit
//This one is confusing hahahahaha.....sad days
var greeting = "Hello, playground"
enum Move: Comparable, Equatable, CaseIterable {
    case rock
    case paper
    case scissors
    
    
    static func ramdom() -> self {
        return Move.allCases.randomElement()
    }
    
}
