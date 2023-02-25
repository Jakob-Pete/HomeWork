import UIKit

var greeting = "Hello, playground"


func removeNum(_ text: String) -> String {
//  var answer = " "
    
    
    
    return text.filter {!"1234567890".contains($0)}
    
//    text.components(separatedBy: CharacterSet.decimalDigits).joined()
//    for num in text {
//        if !"1234567890".contains(num) {
//            answer.append(num)
//        }
//    }
//    return answer
}
removeNum("Thi3s looks5 Grea8t!")
removeNum("yee7t dud3 thats 6sick")
removeNum("y12 15o 62o 42t32 ")
