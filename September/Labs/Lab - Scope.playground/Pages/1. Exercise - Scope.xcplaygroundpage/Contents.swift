/*:
## Exercise - Scope
 
 Using a comment or print statement, describe why the code below will generate a compiler error if you uncomment line 10.
 */
for _ in 0..<10 {
    let foo = 55
    print("The value of foo is \(foo)")
}
//print("The value of foo is \(foo)")
// calling foo outside of the scope wont work gotta watch those {}

//:  Using a comment or print statement, describe why both print statements below compile when similar-looking code did not compile above. In what scope is `x` defined, and in what scope is it modified? In contrast, in what scope is `foo` defined and used?
var x = 10
for _ in 0..<10 {
    x += 1
    print("The value of x is \(x)")
}
print("The final value of x is \(x)")
//this works because the second time it's called is the x from the var that has changes made to it, but the one inside the scope is printing the looped x because it's in the scope{}.

//:  In the body of the function `greeting` below, use variable shadowing when unwrapping `greeting`. If `greeting` is successfully unwrapped, print a statement that uses the given greeting to greet the given name (i.e. if `greeting` successfully unwraps to have the value "Hi there" and `name` is `Sara`, print "Hi there, Sara."). Otherwise, use "Hello" to print a statement greeting the given name. Call the function twice, once passing in a value for greeting, and once passing in `nil`.
func greeting(greeting: String?, name: String) {
    if let greetin = greeting {
        print("\(greetin) \(name)")
    } else {
        print("Hello \(name)")
    }
}
greeting(greeting: "Hello there", name: "Konbi")
greeting(greeting: nil, name: "john")

//:  Create a class called `Car`. It should have properties for `make`, `model`, and `year` that are of type `String`, `String`, and `Int`, respectively. Since this is a class, you'll need to write your own memberwise initializer. Use shadowing when naming parameters in your initializer.
class Car {
    var make: String
    var model: String
    var year: Int
    
    init(make: String, model: String, year: Int) {
    self.make = make
    self.model = model
    self.year = year
    }
}
/*:
page 1 of 2  |  [Next: App Exercise - Step Competition](@next)
 */
