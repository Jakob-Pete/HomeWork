import UIKit

var greeting = "Hello, playground"
func selectSort(fakNum: [Int]) -> [Int] {
    var realNum = fakNum

    for i in 0..<realNum.count {
        var smolNum = realNum[i]
        var index = i
        for j in 0..<realNum.count {
            
            
            if j < i {
                continue
            }
            
            if smolNum > realNum[j] {
                smolNum = realNum[j]
                index = j
            }
            
            if(j+1 == realNum.count) {
                
                realNum.insert(smolNum, at: i)
                realNum.remove(at: index + 1)
            }
        }
    }
    
    return realNum
}
selectSort(fakNum: [3,7,3,22,63,8,0,10])

func selectionSort(nums: [Int]) -> [Int] {
    var myNums = nums

    for i in 0..<myNums.count {
        var smallestNum = myNums[i]
        var index = i
        for j in 0..<myNums.count {

            // We do not want to iterate over the already sorted part of the array

            if j < i {
                continue
            }

            // See if there is a smaller number than what we have stored in smallestNumber

            if smallestNum > myNums[j] {
                smallestNum = myNums[j]
                index = j
            }

            // Done searching for the smallest number

            if(j+1 == myNums.count) {
                // i is our pointer at the end of the sorted part of the array
                // index is the index of the smallest number in the unsorted part of the array

                myNums.insert(smallestNum, at: i)
                myNums.remove(at: index + 1)
            }
        }
    }

    return myNums
}
selectionSort(nums: [3,7,3,22,63,8,0,10])
