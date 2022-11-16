import UIKit

var greeting = "Hello, playground"


func findA(_ letter: [String]) -> String {
    let alphabet: [Character] = "abcdefghijklmnopqrstuvwxyz".split(separator: "").map({ Character(String($0)) })
    
    for (firstLetter, secLetter) in alphabet.enumerated() {
        if secLetter == letter {
            var total = firstLetter
            total += 1
            print("Position of Alphabet: \(total)")
        }
    }
    
   
    
    
    
    
}
let array = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

func letterABC (letter: String) {
    
    
    for (firstLetter, secLetter) in     array.enumerated() {
        
        if secLetter == letter {
            
            var total = firstLetter
            total += 1
            print("Position of Alphabet: \(total)")
        
            
        }
    }
}

letterABC(letter: "b")
