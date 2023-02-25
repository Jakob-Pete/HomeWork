import UIKit

var greeting = "Hello, playground"

// Everybody has probably heard of the animal heads and legs problem from the earlier years at school. It goes:

// "A farm contains chickens and cows. There are x heads and y legs. How many chickens and cows are there?"

// Where x <= 1000 and y <=1000

// Task

// Assuming there are no other types of animals, work out how many of each animal are there.

// Return an Int array [Chickens, Cows]

// If either the heads & legs is negative, the result of your calculation is negative or the calculation is a float return nil

// In the form:

// [Heads, Legs] = [72, 200]

// VALID : [72, 200] =>             [44 , 28]
//                              [Chickens, Cows]

// INVALID : [72, 201] => "No solutions"
// However, if 0 heads and 0 legs are given always return [0, 0] since zero heads must give zero animals.

// There are many different ways to solve this, but they all give the same answer.



// Equations to work with

// Since chickens have 1 head and cows have 1 head
// chickens + cows = heads

// Since chickens have 2 legs and cows have 4 legs:
// 2(chickens) + 4(cows) = legs

// Given that we are given the amount of heads and legs:
// chickens = heads - cows  <-- rewriting first equation
// Then
// 2(heads - cows) + 4(cows) = legs   <-- Substitute chickens
// 2(heads) - 2(cows) + 4(cows) = legs
// 2(heads) + 2(cows) = legs
// 2(cows) = legs - 2(heads)
// cows = (legs - 2(heads)) / 2

// We can then solve for chickens with:
// chickens = heads - cows


//Expected Input --> [Heads, Legs]


func chickensAndCowwws(arr: [Int]) -> [Int]? {
    if arr[0] == 0 && arr[1] == 0 {
        return [0, 0]
    } else if arr[0] < 0 || arr[1] < 0 {
        return nil
    }

    let cows = Double(arr[1] - 2 * arr[0]) / 2
    let chickens = Double(arr[0]) - cows

    // Check that we have an even amount of cows and chickens
    if cows.remainder(dividingBy: 1) > 0 || chickens.remainder(dividingBy: 1) > 0 {
        return nil
    }

    return [Int(chickens), Int(cows)]
}

func chickensAndCows(arr: [Int]) -> [Int]? {
    if arr[0] == 0 && arr[1] == 0 {
        return [0,0]
    } else if arr[0] < 0 || arr[1] < 0 {
        return nil
    }
    let cows = Double(arr[1] - 2 * arr[0]) / 2
    let chickens = Double(arr[0]) - cows
    
    if cows.remainder(dividingBy: 1) > 0 || chickens.remainder(dividingBy: 1) > 0 {
        return nil
    }
    return [Int(chickens), Int(cows)]
}
chickensAndCows(arr: [72, 200])
