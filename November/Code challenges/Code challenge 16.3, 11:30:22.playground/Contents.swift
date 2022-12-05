import UIKit

var greeting = "Hello, playground"

//reverse a fullname from last to first

func nameSwap(firstName: String, lastName: String) -> String {
    return lastName.appending(firstName)
    
    
}
nameSwap(firstName: " john", lastName: "backen")
//just sayin this works too......


func acutalNameSwap(name:String) -> String {
    
    return name.split(separator: " ").reversed().joined(separator: " ")
}
acutalNameSwap(name: "JON steven")
