import UIKit

var greeting = "Hello, playground"


class Vehicle {
    var currentSpeed = 0.0
    
    var description: String {
        "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        
    }
}

let someVehicle = Vehicle()
print("vehicle: \(someVehicle.description)")

class PersonClass {
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
let tin = PersonClass(name: "tim", age: 3)

let copyTin = tin
copyTin.age += 1


