import UIKit

var greeting = "Hello, playground"

func sheepOrWolf(findArray: [String]) {
    for sheep in findArray {
        if sheep == "sheep" {
            print("Oi sheep number \(sheep.count) You are about to be eaten by a wolf")
        } else if sheep == "wolf" {
            print("pls go away and stop eating my sheep")
                  
                  }
        
    }
    
}
sheepOrWolf(findArray: ["sheep", "sheep", "wolf", "sheep"])
