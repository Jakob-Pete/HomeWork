import UIKit

class Person {
    var name: String
    var age: Int
    var weight: Double
    var favColor: String
    
    init(name: String, age: Int, weight: Double, favColor: String) {
        self.name = name
        self.age = age
        self.weight = weight
        self.favColor = favColor
        
    }
}
class Student: Person {
    var currentClass: String = ""
    var Grade: String = ""
    var gpa: Int = 0
    
    init(currentClass: String, )
}

