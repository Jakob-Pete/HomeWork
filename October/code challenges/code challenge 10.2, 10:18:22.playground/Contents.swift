import UIKit

var greeting = "Hello, playground"



func countSentences(_ paragraph: String) -> Int {
var stringCounter = 0
    
    for newString in paragraph {
        if paragraph.contains(".") {
            stringCounter += 1
            
        }
    }

    
    return stringCounter
}
countSentences("hey. how. are. you.")


func sentencecount () {
let input = "there was. a man. who. left."
    let result = input.trimmingCharacters(in: .whitespaces).split(separator: ".")

   print ("The Average Sentence length is \(result.count)")
}
sentencecount()
