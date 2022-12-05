import UIKit

var greeting = "Hello, playground"

func stairsCounting(_ stairs: [[Int]]) -> Int {
   var total = 0
    
    for weekday in stairs {
        for day in weekday {
            total += day
        }
    }
   

   return total * 20
}
