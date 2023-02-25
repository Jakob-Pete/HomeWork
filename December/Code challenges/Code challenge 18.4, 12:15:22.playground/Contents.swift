import UIKit

var greeting = "Hello, playground"
// Description:
// Remove an exclamation mark from the end of a string.

// Examples
// remove("Hi!") === "Hi"
// remove("Hi!!!") === "Hi!!"
// remove("!Hi") === "!Hi"
// remove("!Hi!") === "!Hi"
// remove("Hi! Hi!") === "Hi! Hi"
// remove("Hi") === "Hi"



func removeExclamation(word: String) -> String {
    
    if word.last == "!" {
        return String(word.dropLast())
    } else {
        return word
    }
}
removeExclamation(word: "Hi")
