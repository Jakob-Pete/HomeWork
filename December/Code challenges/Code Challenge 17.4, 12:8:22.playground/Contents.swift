import UIKit

var greeting = "Hello, playground"
// Write an extension on Character that will check if two given characters are the same case.

// If either of the characters is not a letter, return -1
// If both characters are the same case, return 1
// If both characters are letters, but not the same case, return 0
// Examples

// 'a' and 'g' returns 1

// 'A' and 'C' returns 1

// 'b' and 'G' returns 0

// 'B' and 'g' returns 0

// '0' and '?' returns -1

extension Character {
    
    func sameCaseChar(a: Character) -> Int {
        if !self.isLetter || !a.isLetter {
            return -1
        } else if (self.isLowercase && a.isLowercase) || (self.isUppercase && a.isUppercase)
        {
            return 1
        } else {
            return 0
        }
    }
}
let myChar: Character = "a"

myChar.sameCaseChar(a: "b")
myChar.sameCaseChar(a: "A")
myChar.sameCaseChar(a: "2")
