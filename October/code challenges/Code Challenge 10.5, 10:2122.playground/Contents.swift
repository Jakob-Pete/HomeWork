import UIKit

var greeting = "Hello, playground"
//func returnLetterCount(_ letters: String) -> [String: Int] {
//let sentenceArray = letters.split(separator: " s ")
//print(sentenceArray)
//var result: [String: Int] = [:]
//
//for word in sentenceArray {
//    if result[String(word)] != nil {
//        result[String(word)] = result[String(word)]! + 1
//    } else {
//        result[String(word)] = 1
//
//    }
//}
//
//
//return result
//}
//print(returnLetterCount("I like to eat apples and bannanas."))



func arrayStrings(_ array: [String]) {
  var answer = " "
    for words in array {
        answer += (words.lowercased().last == "s") ? "\(words) " : ""
    }
    print(answer)
}
                        
arrayStrings(["yeet", "yeets", "yoots", "mom"])
