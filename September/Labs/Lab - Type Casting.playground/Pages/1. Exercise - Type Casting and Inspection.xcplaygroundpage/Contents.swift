/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */

import Foundation
var thingys: [Any] = [2.1, "yeet", 9, 8.3, true, false, "Yeetmagee"]
print(thingys)
//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for things in thingys {
    if let first = things as? Int {
        print("The integer has a value of \(first)")
    }
}
for things in thingys {
    if let first = things as? Double {
        print("The double has a value of \(first)")
    }
}
for things in thingys {
    if let first = things as? String {
        print("The string has a value of \(first)")
    }
}
for things in thingys {
    if let first = things as? Bool {
        print("The bool has a value of \(first)")
    }
}
//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
var dictionary: [String: Any] = ["food": 3, "cocoa": true, "cheese": 2.67, "yooted": "thats righttt"]
print(dictionary)
//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total: Double = 0
for (index,val) in dictionary {
    if let answerToString = val as? String {
        total += 1
    } else if let answerToBool = val as? Bool {
        if answerToBool == true {
            total += 2
        } else {
            total -= 3
        }
    } else if let answerToInt = val as? Int {
        total += Double(answerToInt)
    } else if let answerToDouble = val as? Double {
        total += answerToDouble
    }
    
}
print(total)
//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2: Double = 0
for (_, val) in dictionary {
    if let answerToString = val as? String {
        total2 += Double(answerToString.count)
    } else if let answerToInt = val as? Int {
        total2 += Double(answerToInt)
    } else if let answerToDouble = val as? Double {
        total2 += answerToDouble
    }
}
print(total2)
/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
