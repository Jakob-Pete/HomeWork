import UIKit

var greeting = "Hello, playground"
// Create a function that is a Hashtag Generator by using the following rules:

// The output must start with a hashtag (#).
// Each word in the output must have its first letter capitalized.
// If the final result, a single string, is longer than 140 characters, the function should return nil.
// If either the input (str) or the result is an empty string, the function should return nil.

// Examples
// generateHashtag("    Hello     World   " ) ➞ "#HelloWorld"

// generateHashtag("") ➞ nil, "Expected an empty string to return nil"

// generateHashtag("Coding is fun") ➞ "#CodingIsFun", "Should remove spaces and capitalize."


func hashtagGenerator(str: String) -> String? {
    guard str.isEmpty else { return nil }
    guard str.count <= 140 else { return nil }
    
    str.replacingOccurrences(of: " ", with: "")

    
    
    return str
}


