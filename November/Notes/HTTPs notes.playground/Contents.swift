import UIKit

var greeting = "Hello, playground"


// HTTP:
// Header - auth tokens if API requires it
// Body - used to post data to the url/database
// URL
// - query parameters

// create a URL
let newDeckURL = URL(string: "https://www.deckofcardsapi.com/api/deck/new/")!

func baseDrawCardUrl(with deckID: String) -> String {
    "https://www.deckofcardsapi.com/api/deck/\(deckID)/draw"
}
func drawCardURL(deckID: String, cardCount: Int) -> URL {
    let baseUrlString = baseDrawCardUrl(with: deckID)
    var components = URLComponents(string: baseUrlString)!
    components.queryItems = [
        URLQueryItem(name: "count", value: "\(cardCount)")
    ]
    // Or you could do this ⌄
//    let searchDictionary = ["count": "\(cardCount)"]
//    components.queryItems = searchDictionary
//        .map({ URLQueryItem(name: $0.key, value: $0.value) })
    return components.url!
}


Task {
    // Call this first and copy the `deck_id` value
    let response = try await URLSession.shared.data(from: newDeckURL)
    // Paste the `deck_id` into the code below and comment out the line above to draw cards from that deck.
//    let url = drawCardURL(deckID: "rwpyiwt5ztjf", cardCount: 10)
//    let response = try await URLSession.shared.data(from: url)
    // this will happen at some point in the future after the network call comes back.
    if let jsonString = String(data: response.0, encoding: .utf8) {
        print(jsonString)
    }

}
