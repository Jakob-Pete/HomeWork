import UIKit

var greeting = "Hello, playground"



//given an array of (ints nums) and an int (target), return indices of the two numbers such that they add up to target. you may assume that each input would have exactly one solution, and you may not use the same element twice. you can return the answer in any order.

func targetInts(_ nums: [Int], _ target: Int) -> [Int] {
    var indexes: [Int] = []
    
    for (i,num) in nums.enumerated() {
        indexes.append(i)
        for(j, num2) in nums.enumerated() {
            if(j != i && num + num2 == target) {
                indexes.append(j)
                return indexes
            }
        }
        indexes = []
    }
    return targetInts()
}
print(targetInts([3,3,2], ))
