import UIKit

var greeting = "Hello, playground"
func reverseSortNames(_ strings: [String]) -> [String] {
   var names = strings
    
    
    
    
    return names.sorted().reversed()
}
print(reverseSortNames(["Bob", "Jill","Hayden","Apple","Steve", "Sally",]))


protocol FullyNamed {
    var fullName: String { get }
    
    func sayFullName()
}

struct Person: FullyNamed {
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    func sayFullName() {
        print(fullName)
    }
    
    var firstName: String 
    var lastName: String
}
