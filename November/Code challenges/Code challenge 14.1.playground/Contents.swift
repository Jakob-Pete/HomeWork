import UIKit

var greeting = "Hello, playground"
// Rock, Paper, Scissors

// Create a function that takes in two strings. The strings will be either "rock", "paper", or "scissors"

// Determine who wins and return a string saying who won

// Examples(Input1, Input2 --> Output):

// "scissors", "paper" --> "Player 1 won!"
// "scissors", "rock" --> "Player 2 won!"
// "paper", "paper" --> "Draw!"

func rockPaperScissors(_  input: String, _ input2: String) -> String {
    if input == "rock" && input2 == "scissors" || input == "scissors" && input2 == "rock" {
        return "Rock beats scissors!!!"
    }
    if input == "scissors" && input2 == "paper" || input == "paper" && input2 == "scissors" {
        return "Scissors beats paaaper!!!"
    }
    if input == "paper" && input2 == "rock" || input == "rock" && input2 == "paper" {
        return "paper ruleeeeessss!"
    } else { return "thats a drawwwwww!"
        
    }
    
    
}
rockPaperScissors("rock", "paper")
rockPaperScissors("scissors", "rock")
rockPaperScissors("paper", "scissors")
rockPaperScissors("paper", "paper")

struct RockPaperScissors: Equatable {
    static func go(lhs: String, rhs: String) -> String {
        switch lhs.lowercased() {
        case "rock":
            switch rhs.lowercased() {
                case "rock":
                return "It's a tie"
            case "paper":
                return "rhs wins! 🏆"
            case "scissors":
                return "lhs wins! 🏆"
            default:
                return "Invalid rhs input: \(rhs)"
            }
            
        case "paper":
            switch rhs.lowercased() {
                case "rock":
                return "rhs wins! 🏆"
            case "paper":
                return "It's a tie"
            case "scissors":
                return "lhs wins! 🏆"
            default:
                return "Invalid rhs input: \(rhs)"
            }
        case "scissors":
            switch rhs.lowercased() {
            case "rock":
                return "It's a tie"
            case "paper":
                return "lhs wins! 🏆"
            case "scissors":
                return "rhs wins! 🏆"
            default:
                return "Invalid rhs input: \(rhs)"
            }
        default:
            return "Invalid lhs input: \(lhs)"
        }
    }
}


let options = ["rock", "paper", "scissosrs"]
for _ in 0...50 {
    let lhs = options.randomElement()!
    let rhs = options.randomElement()!
    print("\(lhs) vs \(rhs)")
    print(RockPaperScissors.go(lhs: lhs, rhs: rhs))
    print("\n")
}






func rackPaperScissors(playerOne: String, playerTwo: String) -> String {
  let playerOneWinsDict = ["rock": "scissors", "paper": "rock", "scissors": "paper"]
  let playerTwoWinsDict = ["rock": "paper", "paper": "scissors", "scissors": "rock"]
  guard playerOneWinsDict[playerOne.lowercased()] != nil, playerOneWinsDict[playerTwo.lowercased()] != nil else {
    return "invalid output"
  }
  if playerOneWinsDict[playerOne.lowercased()] == playerTwo.lowercased() {
    return "Player one wins!"
  }
  if playerTwoWinsDict[playerOne.lowercased()] == playerTwo.lowercased() {
    return "Player two wins!"
  }
  return "It's a draw!"
}
rackPaperScissors(playerOne: "scissors", playerTwo: "rock")
