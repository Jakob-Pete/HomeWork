import UIKit

var greeting = "Hello, playground"
// Is the string uppercase?
// Task
// Create a method to see whether the string is ALL CAPS.

// Examples (input -> output)
// "c" -> False
// "C" -> True
// "hello I AM DONALD" -> False
// "HELLO I AM DONALD" -> True
// "ACSKLDFJSgSKLDFJSKLDFJ" -> False
// "ACSKLDFJSGSKLDFJSKLDFJ" -> True
// A string is said to be in ALL CAPS whenever it does not contain any lowercase letter so any string containing no letters at all is trivially considered to be in ALL CAPS.

func allCaps(strings: String) -> Bool {
    if strings == strings.uppercased() {
        return true
    } else {
        return false
    }
}
allCaps(strings: "yeet")
allCaps(strings: "Yeet")
allCaps(strings: "YEET")
allCaps(strings: "")
allCaps(strings: "3")


extension String {
    var isAllCaps: Bool {
        for char in self {
            guard char.isLetter else { continue }
            if char.isLowercase {
                return false
            }
        }
        return true
    }
}

"i".isAllCaps
"9".isAllCaps
"YEET".isAllCaps
