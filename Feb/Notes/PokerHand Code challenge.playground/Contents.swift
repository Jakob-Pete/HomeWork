import UIKit

/// determineWinner will take in an array of "Poker" hands and determine which hand is better (according to texas holdem rules).
/// Traditionally in Texas Holdem you are only given 2 cards and then 5 other cards are placed flipped up in front of everyone.
/// In our version each player is given 5 cards with no cards placed on the table.
/// Based on just the 5 cards given in a hand. You are to determine what type of winning hands a player has and which is best.
/// For example a player may have a 2 of a kind and a 3 of a kind in a single hand. 3 of a kind is better than 2 of a kind and should be used to determine if their hand is better than any of the other players hands.
///
/// - Returns: Hand - Which is the hand that won. It is expected that the handType property("2 of a kind", "3 of a kind", "4 of a kind", etc) will have a value when returning the winning hand.
extension Sequence where Element: Hashable {
    func containsRepeated(count: Int, excluding: [Element] = []) -> [Element]? {
        var counts: [Element: Int] = [:]
        for element in self {
            if !excluding.contains(element) {
                counts[element, default: 0] += 1
                if counts[element] == count {
                    return [element]
                }
            }
        }
        return nil
    }
}


enum Suit {
    case spades, clubs, hearts, diamonds
}

enum PlayingCardValue: Int {
    case one = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
}

enum WinningHand: Int, Comparable {
    case highCard = 1, onePair, twoPair, threeOfAKind, straight, flush, fullHouse, fourOfAKind, straightFlush, royalFlush
    
    static func < (lhs: WinningHand, rhs: WinningHand) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}


struct Card {
    var suit: Suit
    var value: PlayingCardValue
}


struct Hand {
    let cards: [Card]
    var handType: WinningHand? // Bonus points for changing from a string to a custom enum of all the winningHands
    
    init?(cards: [Card]) {
        guard cards.count == 5 else { return nil }
        self.cards = cards
        self.handType = rankHand()
    }
}
func rankHand(hand: Hand) -> WinningHand? {
    let sortedCards = hand.cards.sorted { $0.value.rawValue > $1.value.rawValue }
    let isFlush = Set(sortedCards.map { $0.suit }).count == 1
    let isStraight = (sortedCards[0].value.rawValue - sortedCards[4].value.rawValue) == 4
    
    switch (isFlush, isStraight, sortedCards.map { $0.value }) {
    case (true, true, let values) where values.contains(.ace):
        return .royalFlush
    case (true, true, _):
        return .straightFlush
    case (_, _, let values) where let repeatedValue = values.containsRepeated(count: 4)?.first:
        return .fourOfAKind
    case (_, let straight, _) where straight:
        return .straight
    case (true, _, _):
        return .flush
    case (_, _, let values) where let threeOfAKindValue = values.containsRepeated(count: 3)?.first:
        if let pairValue = values.containsRepeated(count: 2, excluding: [threeOfAKindValue])?.first {
            return .fullHouse
        } else {
            return .threeOfAKind
        }
    case (_, _, let values) where let twoPairValues = values.containsRepeated(count: 2, excluding: [])?.sorted(by: >): if twoPairValues.count == 2 {
            return .twoPair
        } else {
            return .onePair
        }
    default:
        return .highCard
    }
}

    


    




func determineWinner(hands: [Hand]) -> Hand? {
    guard !hands.isEmpty else {
        return nil
    }
    var winningHand = hands[0]
    
    for hand in hands {
        guard let winningType = winningHand.handType, let handType = hand.handType else {
            return nil
        }
        if winningType < handType {
            winningHand = hand
        }
    }
    
    return winningHand
}


//let testCcard = Card(suit: .hearts, value: .two)
//print(testCard)
//let testCard = Card(suit: .hearts, value: .two)
//print(testCard.suit, testCard.value)


let hand1 = Hand(cards: [Card(suit: .hearts, value: .two), Card(suit: .spades, value: .five), Card(suit: .diamonds, value: .nine), Card(suit: .clubs, value: .jack), Card(suit: .hearts, value: .king)])!

let hand2 = Hand(cards: [Card(suit: .spades, value: .three), Card(suit: .hearts, value: .six), Card(suit: .hearts, value: .seven), Card(suit: .diamonds, value: .nine), Card(suit: .clubs, value: .ten)])!

let hand3 = Hand(cards: [Card(suit: .diamonds, value: .two), Card(suit: .clubs, value: .two), Card(suit: .hearts, value: .two), Card(suit: .spades, value: .nine), Card(suit: .diamonds, value: .king)])!
let royalFlush = Hand(cards: [Card(suit: .clubs, value: .ace), Card(suit: .clubs, value: .king), Card(suit: .clubs, value: .queen), Card(suit: .clubs, value: .jack), Card(suit: .clubs, value: .ten)])!
let hands = [hand1, hand2, hand3]
 print(determineWinner(hands: hands))
if let handType = royalFlush.handType {
    print("My hand has a rank of \(handType).")
} else {
    print("My hand does not have a rank.")
}

