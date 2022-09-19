import UIKit
import Darwin

let birthdayIsToday = true
let invitedGuests: [String] = []
let cake = true
func singHappyBirthday() {
//guard condition else { return }
    guard birthdayIsToday else {
        print("no birthday today")
        return
    }
    guard !invitedGuests.isEmpty else {
        print("no one is here yet")
        return
    }
    guard !cake else {
        print("need to get the cake!")
        return
    }
    print("Sing happy birthday")
}
singHappyBirthday()
//    the _ is so with dicide it looks better and the by is so the code is easy to read when you call it
func divide(_ number: Double, by divisor: Double) {
    guard divisor != 0.0 else {
        return
    }
    let reuslt = number / divisor
    print(reuslt)
    
    //    if divisor != 0.0 {
//        let result = number / divisor
//        print(result)
//    }
}
divide(2.4, by: 4.5)
    
func processBook(title: String?, price: Double?, pages: Int?) {

    guard let theTitle = title,
    let thePrice = price,
    let thePages = pages else {
        return
    }
    print("\(theTitle) costs $\(thePrice) and has \(thePages) pages")
}
//        if let theTitle = title,
//        let thePrice = price,
//        let thePages = pages {
//        print("\(theTitle) costs $\(thePrice) and has \(thePages) pages")
//    }
//}
processBook(title: "The Way of Kings", price: 19.95, pages: 1007)
//if let eggs = goose.eggs {
//    print("the goose laid \(eggs.count) eggs")
//}
//guard let eggs = goose.eggs else { return
//} print("the goose laid \(eggs.count) eggs")
//doSomething(eggs)

    //    if !birthdayIsToday{
//        print("no birthday today")
//        return
//    }
//    if invitedGuests.isEmpty{
//        print("no one is here yet")
//        return
//    }
//    if !cake {
//        print("need to get the cake!")
//        return
//    }
//    print("Sing happy birthday")
//}


    //    if birthdayIsToday {
    //        if !invitedGuests.isEmpty {
    //            if cake {
    //                print("Happy birthday")
    //            } else {
    //                print("Need to light candeles")
    //            }
    //        }
    //    }
    //}

//enums
enum CompassPoint{
    case north, south, west, east
}
var compassHeading = CompassPoint.west
compassHeading = .north
print(compassHeading)

switch compassHeading {
    case .north:
        print("heading north")
    case .east:
        print("heading east")
    case .south:
        print("heading south")
    case .west:
        print("heading west")
    }
enum Genre {
    case animated, action, thriller
}
struct Moive {
    var name: String
    var realseyear: Int?
    var genre: Genre
}
let movie = Moive(name: "wolfwakers", realseyear: 2020, genre: .animated)
print(movie)

