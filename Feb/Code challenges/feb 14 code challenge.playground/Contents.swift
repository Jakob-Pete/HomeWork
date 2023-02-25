import UIKit

var greeting = "Hello, playground"

//Here is the code challenge and solution for today:
// The additive persistence of an integer, n, is the number of times you have to replace n with the sum of its digits until n becomes a single digit integer.

// Create a function that take an integer as an argument and:

// Return its additive persistence.

// Examples: Additive Persistence
// additivePersistence(1679583) ➞ 3
// 1 + 6 + 7 + 9 + 5 + 8 + 3 = 39
// 3 + 9 = 12
// 1 + 2 = 3
// It takes 3 iterations to reach a single-digit number.

// additivePersistence(123456) ➞ 2
// 1 + 2 + 3 + 4 + 5 + 6 = 21
// 2 + 1 = 3

// additivePersistence(6) ➞ 0
// Because 6 is already a single-digit integer.

extension StringProtocol  {
    var digits: [Int] { compactMap(\.wholeNumberValue) }
}

func additivePersistence1(num: Int) -> Int {
    var functionId = Int.random(in: 1...200)
    print("NEW additivePersistence: \(functionId) with num \(num)")
    var eachDigit = String(num).digits

    if eachDigit.count == 1 {
        print("\(functionId) RETURNING 0")
        return 0
    }

    var sumOfEachDigit = eachDigit.reduce(0) { $0 + $1 }
    print("\(functionId) DOING WORK: sum of \(num) is \(sumOfEachDigit)")

    let returnValue = 1 + additivePersistence1(num: sumOfEachDigit)
    print("\(functionId) RETURNING \(returnValue)")
    return returnValue
}

func additivePersistence2(num: Int) -> Int {
    var eachDigit = String(num).digits
    
    if eachDigit.count == 1 {
        return 0
    }
    
    var sumOfEachDigit = eachDigit.reduce(0) { $0 + $1 }

    return 1 + additivePersistence2(num: sumOfEachDigit)
}

additivePersistence2(num: 1679583)
//func additivePersistence(n: Int) -> Int? {
//
//    var stringN = String(n)
//    var numN = Int(stringN)
//
//    for num in stringN {
//        stringN.map { String($0) }
//        guard var test = numN else { return nil }
//        test = Int(stringN)!
//        test += test
//        return test
//    }
//
//
//
//
//
//
//    return 0
//}
//additivePersistence(n: 123)

////when you ask chatGPT to help you solve this
func sumOfDigits(_ n: Int) -> Int {
    let string = String(n)
    let digits = string.map { Int(String($0)) ?? 0 }
    let sum = digits.reduce(0, +)
    return sum
}
sumOfDigits(1679583)


func sumOfDigitss(_ n: Int) -> Int {
    return n < 10 ? n : n % 10 + sumOfDigits(n / 10)
}
sumOfDigitss(1679583)
