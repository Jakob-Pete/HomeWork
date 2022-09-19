import UIKit

func multiplyByFive(array: [Int]) -> [Int] {
    var num : [Int] = []
    for numb in array {
        let newNum = numb * 5
        num.append(newNum)
        
    }
return num
}
let answer = multiplyByFive(array: [0, 1, 2, 4, 8, 16])
print(answer)
