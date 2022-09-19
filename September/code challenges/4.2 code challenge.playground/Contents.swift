import UIKit

var greeting = "Hello, playground"
//func wacky(namePlace: [Int]) ->  {
//    if namePlace > namePlace + 1 {
//        return nil
//    } else if namePlace != namePlace + 1
//        }
//}
func work(in array: [Int]) -> Int? {
     var compareNumber: Int = array.first!
    for int in array.dropFirst() {
        if int != compareNumber + 1 {
            return int
        } else {
            compareNumber = int
        }
    }
    return nil
}
work(in: [1,2,3,4,6,7,8])
work(in: [-1,0,1,4])
work(in: [1,2,3,4,5])
