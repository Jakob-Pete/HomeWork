import UIKit

var greeting = "Hello, playground"








//func tellWords(_ zanderSucks: String)  {
//
//    var dict = [String: any]
//
//    for x in zanderSucks {
//            var count = 0
//            for y in zanderSucks {
//                if y == x {
//                    count += 1
//                }
//            }
//
//            dict[x] = count
//        }
//
//        print(dict)
//    }
//
//
func occuence(sentence: String) -> [String: Int] {
    let sentenceArray = sentence.split(separator: " ")
    print(sentenceArray)
    var result: [String: Int] = [:]
    
    for word in sentenceArray {
        if result[String(word)] != nil {
            result[String(word)] = result[String(word)]! + 1
        } else {
            result[String(word)] = 1
            
        }
    }
    
    
    return result
}
print(occuence(sentence: "a sentence test which is a test"))
