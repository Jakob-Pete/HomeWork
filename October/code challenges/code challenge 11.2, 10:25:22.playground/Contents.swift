import UIKit

var greeting = "Hello, playground"
// You may remember that a palindrome is a word that's spelled the same backward and forwards — like "mom" or "racecar." Create a function that accepts a string as input and returns TRUE if the string is a palindrome.

// For an extra challenge, find a way to check whether a phrase or sentence is a palindrome — for example, "Taco Cat" or, "Too bad I hid a boot." You'll have to find a way to remove spaces in your phrases to get the function to work.


extension String {
    func isPalindrome() -> Bool {
        
        let mod = self.lowercased()
        
        return String(mod.reversed()) == mod    }
}

let strings = ["racecar", "daD", "golf", "jury", "mom"]

for string in strings {
    print("\(string) - \(string.isPalindrome())")
}

let phrases = ["Too bad I hid a boot", "Taco Cat", "Totally not a palindrome"]

for phrase in phrases {
    print("\(phrase) - \(phrase.isPalindrome())")
}
