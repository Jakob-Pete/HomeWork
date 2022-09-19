import UIKit

//var greeting = "Hello, playground"
//let names = ["john","steve"]
//for name in names {
//    print("hello \(name)")
//}
//
//for counter in -10...10 {
//    print(counter)
//    if counter == -2 {
//        break
//    }
//}

var zoo = ["elephant", "Peguin", "capybara", "Red panda"]
//for animal in zoo {
//    var printStatement = ""
//    let vowels: [Character] = ["a", "e", "i", "o", "u"]
//
//    if vowels.contains(animal.lowercased().first!) {
//        printStatement = "the zpp jas an"
//    } else {
//        printStatement = "the zoo has a"
//    }
//
//    print("\(printStatement) \(animal)")
// }


//for (index, letter) in "mississippi".enumerated() {
//    print("\(index) letter: \(letter)")
//}
//
//print(zoo.count)
//for index in 0..<zoo.count {
//    print(zoo[index])
//}


//var books = ["The Dictionary": 1257, "Harry potter and the sorcerer's stone": 265, "Guliver's travels": 420]
//for (title, pageNum) in books {
//    print("the book \(title) has \(pageNum) pages")
//}
//
//

var steps = 0
var wall = 2

repeat {
    print("stop")
    
    steps += 1
    
    if steps == wall {
        print("youve hit a wall!")
        break
    }
} while steps < 0

var kayakingSpots = ["Alaska", "Canada", "Hawaii", "Idaho"]
var randomNum = Int.random(in: 0...3)
print(kayakingSpots[randomNum])

for spot in kayakingSpots {
    
    print("I like to kayak in \(spot)")
}
