import UIKit


struct Person {
    let name: String
    var age: Int
    var height: Double
    var weight: Int
    
    func greeting()
    {
        print("Hello! My name is \(name), and I am \(age) years old ")
    }
    mutating func birthday()
    {
        age += 1
    }
    
}
var person = Person(name: "john", age: 23, height: 5.7, weight: 143)
print(person.greeting())
person.birthday()
print(person.greeting())
