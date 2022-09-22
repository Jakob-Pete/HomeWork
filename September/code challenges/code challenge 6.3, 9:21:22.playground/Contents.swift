import UIKit

var greeting = "Hello, playground"
var h = 0
var m = 1
var s = 1

func maybe() -> Int {
    
return ((60 * m) + s) * 1000

}
maybe()
print(maybe())

func millaseconds(h: Int, m: Int, s: Int) -> Int {
    
    return(h * 3600000 ) + (m * 60000) + (s * 1000)
    
}
print(millaseconds(h: 4, m: 1, s: 64))
