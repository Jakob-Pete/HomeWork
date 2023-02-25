import UIKit

var greeting = "Hello, playground"

// Given an array of numbers, check if any of the numbers are the ASCII values for lower case vowels (a, e, i, o, u).

// If they are, append the index of that value to an array in a dictionary where vowels are the keys.

// Return the resulting array.

// Hint: https://www.asciitable.com/
// https://stackoverflow.com/questions/24354549/how-to-get-string-from-ascii-code-in-swift

func findLetter(_ arr: [Int]) -> [Character: [Int]] {
    var result: [Character: [Int]] = ["a": [], "e": [], "i": [], "o": [], "u": []]
    for (i, num) in arr.enumerated() {
        switch Character(UnicodeScalar(num) ?? "z") {
        case "a", "e", "i", "o", "u": result[Character(UnicodeScalar(num)!)]?.append(i)
        default: result
        }
    }
return result
}
print(findLetter([97,12,100,101,105,111,117]))
