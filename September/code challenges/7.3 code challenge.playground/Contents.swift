import UIKit

var greeting = "Hello, playground"


var number = 3

for index in 1...10 {
    print("\(number) * \(index) = \(index * number)")
    
}


func table(num: Int) -> String {
    var numTab: String = ""
    
    for val in 1...10 {
        numTab += "\(val) * \(num) = \(val * num) \n "
    }
    return numTab
}
table(num: 8)
print(table(num: 8))
