import UIKit

var greeting = "Hello, playground"
//func bubbleTime(_ num: [Int]) -> [Int] {
//    var numBubble = num
//    for i in 0..<numBubble.count{
//        for u in 0..<numBubble.count-i-1{
//            if numBubble[u] > numBubble[u+1]{
//                numBubble.swap(u, u+1)
//            }
//        }
//    }
//    return numBubble
//}
//bubbleTime([5,3,6,37,3])
//from yesterday
func sortInsert(_ numb: [Int]) -> [Int] {
    var num = numb
    for i in 1..<num.count{
        var u = i
        while u > 0 && num[u] < num[u - 1] {
            num.swapAt(u - 1, u)
            u -= 1
        }
    }
    return num
}
sortInsert([6,63,7,3,7,35,6,3,9,0,42,65,79,6,7])

