import UIKit

var greeting = "Hello, playground"




func bubbleTime(_ num: [Int]) -> [Int] {
    var numBubble = num
    for i in 0..<numBubble.count{
        for u in 0..<numBubble.count-i-1{
            if numBubble[u] > numBubble[u+1]{
                numBubble.swapAt(u, u+1)
            }
        }
    }
    return numBubble 
}
    bubbleTime([4,6,3,7,5,3,64,25,254])
   print(bubbleTime([4,6,3,7,5,3,64,25,254]))
    


    
    
func bubbleSort(arrValue:[Int])->[Int]{
       var arr = arrValue
       for i in 0..<arr.count-1{
           for j in 0..<arr.count-i-1{
               if arr[j] > arr[j+1]{
                   arr.swapAt(j, j+1)
               }
           }
       }
       print(arr)
       return arr
}
    bubbleSort(arrValue: [5,3,6,8,5,8])
    
    
    
    
//    for i from 1 to N
//            for j from 0 to N - 1
//               if num[j] > num[j + 1]
//                  swap( num[j], num[j + 1] )
//}

