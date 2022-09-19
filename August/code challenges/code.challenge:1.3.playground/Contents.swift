import UIKit
import Darwin

var greeting = "Hello, playground"
let name = "Brayden"
let age = 23
print("Welcome \(name) to the thunderdome! at the age of \(age) you pass to come in!")





func letterCount(word: String) -> Int {
    let count = word.count
return count
}
let answer = letterCount(word: "foooooood")
print(answer)



func add(_ firstNumber: Int, to secondNumber: Int) -> Int{
return firstNumber + secondNumber
}
add (4, to: 9)
