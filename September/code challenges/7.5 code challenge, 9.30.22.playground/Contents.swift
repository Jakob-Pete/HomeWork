import UIKit

var greeting = "Hello, playground"


func roundDecf(num: Float, sigf: Int) -> Float {

   

    return  roundf(num * pow(10, (Float(sigf)) / pow(10, Float(sigf))))


}

func math(a: Float, b: Float, c: Float) -> Float {
    let s = (a + b + c) / 2
    
    let anotherArea = sqrtf(s * (s - b) * (s - a) * (s - c))
    
    return round(anotherArea * 100) / 100
    
//    let s = (a + b + c) / 2
//    let anotherOne = sqrt(s * (s - b)*(s - a) * (s-c))
//
//
//    return String(format: "%.2f", anotherOne)
    
}

math(a: 3, b: 5, c: 3)
