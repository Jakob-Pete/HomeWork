import Foundation
// Are there any functions or objects that don't care about what type you're passing into them/aren't type sensitive?  Examples:
max("something", "asomething")
max(5, 4)
/*
 * let something = Dictionary()
 * let somethingElse = Array()
 */

// How does this work?  If Swift is built with swift and Apple isn't cheating with these baked in functions and objects, then we should be able to do the same thing, too!  Let's take a look at another example:

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var firstInt = 3
var secondInt = 500

print("firstInt: \(firstInt), secondInt: \(secondInt)")
swapTwoInts(&firstInt, &secondInt)
print("firstInt: \(firstInt), secondInt: \(secondInt)")

// while only relevant to this example and not to this lesson, inout gives us a special power: to alter variables passed into the function, outside of it.  See the two print statements.

// Now, let's say I wanted a swapTwoStrings function, and a swapTwoDoubles as well:
func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

// All three of these functions are literally exactly alike, save for the type of values that they accept.  Boy, wouldn't it be nice if we could only write this code once in our app, for any type?  With generics, this is possible.

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
swapTwoValues(&firstInt, &secondInt)
print("firstInt: \(firstInt), secondInt: \(secondInt)")

// Here, instead of using a defined type, we're using a placeholder type (of "T", for "Type").  As you notice, right next to "swapTwoValues" in the function declaration there's a "<T>" declaration.  This tells the compiler that you are declaring a local, generic type in this function, and anytime it comes across "T" it should keep going as that type can be whatever is passed into the function.  Note, however, that both variables passed into the function have the same "T" type, and as such this function will still throw an error if two variables of non-matching types are passed into this function.  It still requires a double & a double, a string and a string.

//Array()

//Let's look at Array's definition:
// struct Array<Element> {}

struct HybridCarEngine<Fuel> {
    // could be gas, could be electricity
    
}

//Dictionary()

// Let's focus on the definition of Dictionary here:
//struct Dictionary<Key, Value> where Key : Hashable {}

// this struct accepts two generic parameters, "Key" and "Value".  It further declares that whatever type is passed into Key must conform to the protocol Hashable.

// Protocols
// associated types enable protocols to define placeholders of any type, enables generic protocols:

protocol APIRequest {
    associatedtype Response
    var urlRequest: URLRequest { get }
    func decodeResponse (data: Data) throws -> Response
}

// notice how the decodeResponse function throws "Response" which is defined as associatedtype.  This way, we can use this protocol for all our API calls.

// Proceed to page 586 in the "Develop in Swift: Data Collections" book and follow along with changing an old project from using two API calls to one.
