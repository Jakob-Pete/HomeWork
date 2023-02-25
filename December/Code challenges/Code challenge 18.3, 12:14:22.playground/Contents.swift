import UIKit

var greeting = "Hello, playground"

// Write a function that takes a list of strings as an argument and returns a filtered list containing the same elements but with the 'geese' removed.

// The geese are any strings in the following array
// ["African", "Roman Tufted", "Toulouse", "Pilgrim", "Steinbacher"]

// For example, if this array were passed as an argument:
// ["Mallard", "Hook Bill", "African", "Crested", "Pilgrim", "Toulouse", "Blue Swedish"]

// Your function would return the following array:
// ["Mallard", "Hook Bill", "Crested", "Blue Swedish"]

func yeetTheGeese(array: [String]) -> [String] {
  let geese = ["African", "Roman Tufted", "Toulouse", "Pilgrim", "Steinbacher"]
    
    return array.filter{ (!geese.contains($0)) }
    
    
}
print(yeetTheGeese(array: ["Mallard", "Hook Bill", "African", "Crested", "Pilgrim", "Toulouse", "Blue Swedish"]))
