/*:
## Exercise - Failable Initializers

 Create a `Computer` struct with two properties, `ram` and `yearManufactured`, where both parameters are of type `Int`. Create a failable initializer that will only create an instance of `Computer` if `ram` is greater than 0, and if `yearManufactured` is greater than 1970, and less than 2020.
 */
struct Computer {
    let ram: Int
    let yearMade: Int
    
    init?(ram: Int, yearMade: Int) {
        if ram > 0 && yearMade > 1970 && yearMade < 2020 {
        self.ram = ram
        self.yearMade = yearMade
        } else {
            return nil
        }
    }
}
    
//:  Create two instances of `Computer?` using the failable initializer. One instance should use values that will have a value within the optional, and the other should result in `nil`. Use if-let syntax to unwrap each of the `Computer?` objects and print the `ram` and `yearManufactured` if the optional contains a value.
if let computer = Computer(ram: 1, yearMade: 1990){
    print(computer.ram)
    print(computer.yearMade)
}
if let computer2 = Computer(ram: 1, yearMade: 1980) {
    print(computer2.ram)
    print(computer2.yearMade)
}

let computer3 = Computer(ram: 7, yearMade: 2021)

if let computer3 = computer3 {
    print(computer3)
}

/*:
[Previous](@previous)  |  page 5 of 6  |  [Next: App Exercise - Workout or Nil](@next)
 */
