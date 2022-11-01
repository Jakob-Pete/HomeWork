import UIKit

var greeting = "Hello, playground"



func factorialThing(num: Int) -> Int {
    
    return (num == 0 ) ? 1 : num * factorialThing(num: (num-1))
    
}

factorialThing(num: 5)
