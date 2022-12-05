import UIKit

var greeting = "Hello, playground"
// Given a string, you have to return a string in which each character (case-sensitive) is repeated once.

// Examples (Input -> Output):
// * "String"      -> "SSttrriinngg"
// * "Hello World" -> "HHeelllloo  WWoorrlldd"
// * "1234!_ "     -> "11223344!!__  "
// Good Luck!

func doubleLetter(string: String) -> Void {
    var doubleString = ""
    for char in string {
        doubleString += "\(char)\(char)"
        
    }
    print(doubleString)
    
}
doubleLetter(string: greeting)
