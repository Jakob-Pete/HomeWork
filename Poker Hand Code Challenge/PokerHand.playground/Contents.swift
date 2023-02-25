import UIKit


/// determineWinner will take in an array of "Poker" hands and determine which hand is better (according to texas holdem rules).
/// Traditionally in Texas Holdem you are only given 2 cards and then 5 other cards are placed flipped up in front of everyone.
/// In our version each player is given 5 cards with no cards placed on the table.
/// Based on just the 5 cards given in a hand. You are to determine what type of winning hands a player has and which is best.
/// For example a player may have a 2 of a kind and a 3 of a kind in a single hand. 3 of a kind is better than 2 of a kind and should be used to determine if their hand is better than any of the other players hands.
///
/// - Returns: Hand - Which is the hand that won. It is expected that the handType property("2 of a kind", "3 of a kind", "4 of a kind", etc) will have a value when returning the winning hand.

enum Suit {
    case spades, clubs, hearts, diamonds
}

enum PlayingCardValue: Int {
    case one = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
}

struct Card {
    var suit: Suit
    var value: PlayingCardValue
}

struct Hand {
    let cards: [Card]
    var handType: String?
    
    init?(cards: [Card]) {
        guard cards.count == 5 else { return nil }
        self.cards = cards
    }
}

func determineWinner(hands: [Hand]) -> Hand {
    var bestHand = hands[0]
    var (bestScore, bestHandType) = getScoreAndType(for: bestHand)
    
    for hand in hands.dropFirst() {
        let (score, handType) = getScoreAndType(for: hand)
        if score > bestScore {
            bestHand = hand
            bestScore = score
            bestHandType = handType
        }
    }
    bestHand.handType = bestHandType
    return bestHand
}

private func getScoreAndType(for hand: Hand) -> (Int, String) {
    let sortedCards = hand.cards.sorted { $0.value.rawValue > $1.value.rawValue }
    let values = sortedCards.map { $0.value.rawValue }
    let uniqueValues = Set(values)
    // Check for flush
    let flush = sortedCards.allSatisfy { $0.suit == sortedCards.first!.suit }
    
    // Check for straight
    let straight = uniqueValues.count == 5 && values.max()! - values.min()! == 4
    
    // Check for straight flush or royal flush
    if flush && straight {
        if values.max() == PlayingCardValue.ace.rawValue {
            return (10, "Royal Flush")
        } else {
            return (9, "Straight Flush")
        }
    }
    // Check for four of a kind
    for value in uniqueValues {
        if values.filter({ $0 == value }).count == 4 {
            return (8, "Four of a Kind")
        }
    }
    // Check for full house
    if uniqueValues.count == 2 && values.filter({ $0 == Array(uniqueValues)[0] }).count == 2 {
        return (7, "Full House")
    }
    // Check for flush
    if flush {
        return (6, "Flush")
    }
    // Check for straight
    if straight {
        return (5, "Straight")
    }
    // Check for three of a kind
    for value in uniqueValues {
        if values.filter({ $0 == value }).count == 3 {
            return (4, "Three of a Kind")
        }
    }
    // Check for two pair
    if uniqueValues.count == 3 {
        return (3, "Two Pair")
    }
    // Check for pair
    if uniqueValues.count == 4 {
        return (2, "Pair")
    }
    // High card
    return (1, "High Card")
}


let hand1 = Hand(cards: [
    Card(suit: .hearts, value: .ace),
    Card(suit: .hearts, value: .king),
    Card(suit: .hearts, value: .queen),
    Card(suit: .hearts, value: .jack),
    Card(suit: .hearts, value: .ten)
])!

let hand2 = Hand(cards: [
    Card(suit: .spades, value: .two),
    Card(suit: .hearts, value: .two),
    Card(suit: .clubs, value: .two),
    Card(suit: .diamonds, value: .three),
    Card(suit: .hearts, value: .three)
])!

let hand3 = Hand(cards: [
    Card(suit: .hearts, value: .four),
    Card(suit: .clubs, value: .four),
    Card(suit: .hearts, value: .five),
    Card(suit: .diamonds, value: .five),
    Card(suit: .spades, value: .five)
])!

let hands = [hand1, hand2, hand3]

let winner = determineWinner(hands: hands)
for winningCard in winner.cards {
    print(winningCard.value, winningCard.suit)
}







