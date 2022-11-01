import UIKit

var greeting = "Hello, playground"


func primeNumber(_ numbs: Int) -> Bool {
    if ((numbs / 1) != 0) &&  ((numbs % 2) != 0) {
        return true
    } else { return false
    }
}
primeNumber(5)

func isPrime(num: Int) -> Bool {
    guard num > 2 else { return true }
    
    for v in 2...num {
        return num % v != 0
    }
    return true
}
isPrime(num: 41893)


func isPrime(_ number: Int) -> Bool {
    return number > 1 && !(2..<number).contains { number % $0 == 0 }
}
isPrime(41893)
