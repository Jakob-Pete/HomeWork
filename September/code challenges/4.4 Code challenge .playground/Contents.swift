import UIKit

func firstElements(array: [Int],n:Int) -> [Int]{
 
    return Array(array[..<n])
}
firstElements(array: [0,1,2,3], n: 2)
