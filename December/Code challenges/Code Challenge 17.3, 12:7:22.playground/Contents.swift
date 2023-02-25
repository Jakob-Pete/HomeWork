import UIKit

var greeting = "Hello, playground"
// I have a cat and a dog.

// I got them at the same time as a kitten/puppy. That was humanYears years ago.

// Return their respective ages now as [humanYears,catYears,dogYears]

// NOTES:

// humanYears >= 1
// humanYears are whole numbers only

// Cat Years
// 15 cat years for first year
// +9 cat years for second year
// +4 cat years for each year after that

// Dog Years
// 15 dog years for first year
// +9 dog years for second year
// +5 dog years for each year after that

//func animallyYears(humanYears: Int) -> [Int] {
//    guard humanYears >= 1 else { return [403]}
//    var cat = 0
//    var dogo = 0
//
//    if humanYears == 1 {
//        cat += 15
//        dogo += 15
//    } else if humanYears == 2 {
//        cat += 9
//        dogo += 9
//    }
//    for years in 3...humanYears {
//        cat += 4
//        dogo += 5
//    }
//
//    return [humanYears,cat,dogo]
//}

func animalYears(humanYears: Int) -> [Int] {
    var catYears = 0
    var dogYears = 0

    for num in 1...humanYears {
        if num == 1 {
            catYears+=15
            dogYears+=15
        }
        else if num == 2 {
            catYears+=9
            dogYears+=9
        } else {
            catYears+=4
            dogYears+=5
        }
    }

    return [humanYears, catYears, dogYears]
}
animalYears(humanYears: 5)

