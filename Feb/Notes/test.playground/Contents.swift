import UIKit
class ViewController: UIViewController {
  let cards: [Card] = []
  func checkHand(_ cards: [Card]) -> String {
    let sortedCards: [Card] = cards.sorted(by: {$0.rank.cardValue < $1.rank.cardValue})
    let cardValue = sortedCards.map { $0.rank.cardValue }
    let suits = sortedCards.map { $0.suit }
    if Set(suits).count == 1 {
      if cardValue == [10, 11, 12, 13, 14] {
        return "Royal Flush"
      } else if Set(cardValue).count == 1 {
        return "Straight Flush"
      } else if let maxRank = cardValue.max(), maxRank - cardValue.min()! == 4 {
        return "Straight Flush"
      } else {
        return "Flush"
      }
    } else if Set(cardValue).count == 2 {
      let firstCardValueCount = cardValue.filter { $0 == cardValue[0] }.count
      let secondCardValueCount = cardValue.filter { $0 == cardValue[1] }.count
      if firstCardValueCount == 4 || secondCardValueCount == 4 {
        return "Four of a Kind"
      } else {
        return "Full House"
      }
    } else if Set(cardValue).count == 3 {
      let rankCounts = cardValue.map { rank in
        return cardValue.filter { $0 == rank }.count
      }
      if rankCounts.contains(3) {
        return "Three of a Kind"
      } else {
        return "Two Pair"
      }
    } else if Set(cardValue).count == 4 {
      return "One Pair"
    } else {
      return "High Card"
    }
  }
//  let cards = [
//    Card(rank: .two, suit: .hearts),
//    Card(rank: .seven, suit: .clubs),
//    Card(rank: .ace, suit: .spades),
//    Card(rank: .five, suit: .diamonds),
//    Card(rank: .three, suit: .hearts)
//  ]
}
enum Suit {
  case spades
  case hearts
  case diamonds
  case clubs
}
struct PlayingCardValue {
  let cardValue: Int
  let description: String
  init(cardValue: Int) {
    self.cardValue = cardValue
    if cardValue > 10 {
      self.description = ""
    } else {
      self.description = String(cardValue)
    }
  }
}
struct Card {
  let rank: PlayingCardValue
  let suit: Suit
  var description: String {
    return "\(rank.description)\(suit)"
  }
}
