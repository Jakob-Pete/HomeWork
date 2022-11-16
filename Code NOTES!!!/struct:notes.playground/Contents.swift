import UIKit

var greeting = "Hello, playground"



struct Firearm {
    let barrelLength: Double
    let ammoType: String
    let lenghOfGun: Double
    
    
    init(barrelLength: Double, ammoType: String, lengthOfPull: Double) {
        self.barrelLength = barrelLength
        self.ammoType = ammoType
        self.lenghOfGun = lengthOfPull + barrelLength
    }
}

let myShotgun = Firearm(barrelLength: 28.22, ammoType: "12 Gauge", lengthOfPull: 12)
print(myShotgun.lenghOfGun)



struct Home {
    let sqrFoot: Double
    let type: String
    let stories: Int
    
    init(sqrFoot: Double, type: String, stories: Int) {
        self.sqrFoot = sqrFoot
        self.type = type
        self.stories = stories
    }
    
}
let myHome = Home(sqrFoot: 14444.23, type: "the old one", stories: 3)
print(myHome.stories)

struct Size {
    var width: Double
    var height: Double
    
    func area() -> Double {
        width * height
    }
}
let sqaureSize = Size(width: 4.4, height: 5.7)
print(sqaureSize.area())

enum breadType{
    case white
    case wheat
}
struct Sandwich {
    var bread: String = "white"
    let tomatio: Bool
    let lettuce: Bool
    
    init(tomatio: Bool, lettuce: Bool) {
        self.tomatio
        self.lettuce
    }
}



