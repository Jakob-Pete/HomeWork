import UIKit

func century(key: Int) -> Int {
    guard key > 0 else { return 0 }
    
    let num = Double(key)/100
    let century = num.rounded(.up)
    return Int(century)
}
print(century(key: 1601))
