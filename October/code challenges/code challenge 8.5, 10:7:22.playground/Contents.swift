import UIKit
import Darwin












print(" it takes an array of numbers and then splits it equally in half and then goes through that process again and again until it can't half it. then it moves them to start from smallest to largest when reconstructing the array")



func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
  guard array.count > 1 else { return array }

  let middleIndex = array.count / 2
  
  let leftArray = mergeSort(Array(array[0..<middleIndex]))
  let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
  
  return merge(leftArray, rightArray)
}

func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
  var leftIndex = 0
  var rightIndex = 0

  var orderedArray: [T] = []
  
  while leftIndex < left.count && rightIndex < right.count {
    let leftElement = left[leftIndex]
    let rightElement = right[rightIndex]

    if leftElement < rightElement {
      orderedArray.append(leftElement)
      leftIndex += 1
    } else if leftElement > rightElement {
      orderedArray.append(rightElement)
      rightIndex += 1
    } else {
      orderedArray.append(leftElement)
      leftIndex += 1
      orderedArray.append(rightElement)
      rightIndex += 1
    }
  }

  while leftIndex < left.count {
    orderedArray.append(left[leftIndex])
    leftIndex += 1
  }

  while rightIndex < right.count {
    orderedArray.append(right[rightIndex])
    rightIndex += 1
  }
  
  return orderedArray
}
mergeSort([5,1,5,7,8,24,12,16,74])
print(merge([4, 5, 7, 8, 13], [5, 6, 86, 166, 1684, 84]))
