import UIKit
import CoreGraphics

let color = "Blue"
let number = 50
let letter = "a"

if color == "Blue" {
    print("That's my fav color")
} else {
    print("cool!")
}
print(color)

if number > 0 && number < 100{
    print("that is a valid number")
}  else {print("that is NOT a valid number")
}
print(number)

switch letter {
case "a", "e", "i", "o", "u" :
    print("YA thats the right letter")
default:
    print("nope it's not")
}

