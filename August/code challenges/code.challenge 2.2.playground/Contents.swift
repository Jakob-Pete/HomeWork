import UIKit


struct Rectangle{
    var sideA: Int
    var sideB: Int
    
    func area() -> Int {
    return  sideA * sideB
        
    }
    
    
    func perimeter() -> Int {
       return 2 * (sideA + sideB)
    }
    
     mutating func scale() {
        (sideA + sideB) * 2 + (sideB + sideA) * 2
        
        
    }
    }
let answer = Rectangle(sideA: 10, sideB: 10)
print(answer.area())
print(answer.perimeter())



