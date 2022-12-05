import UIKit

var greeting = "Hello, playground"



func stringIntoDigit(_ numString: String) -> Bool {
    let rangeNum = NSRange(location: 0, length: numString.utf16.count)
    let refex = try! NSRegularExpression(pattern: "[0-9]")
    if refex.firstMatch(in: numString, range: rangeNum) != nil {
        return true
    } else { return false
        
    }
}

stringIntoDigit("6")
stringIntoDigit("g")
stringIntoDigit("f9")
stringIntoDigit("1t")




//
//extension String {
//    var isNumber: Bool {
//        let digitsCharacters = CharacterSet(charactersIn: "0123456789")
//        return CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)
//    }
//}


extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}
