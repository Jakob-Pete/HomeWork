import UIKit

var greeting = "Hello, playground"

import UIKit

struct Person {
    var name: String
}

let names = ["Bob", "Stan", "Julie", "Beth"]

// MARK: - MAP
let people: [Person] = names.map { name in
    return Person(name: name)
}
let peopleExplicit = names.map { (name: String) -> Person in
    return Person(name: name)
}
let peopleSyntacticSugar = names.map { Person(name: $0) }

// MARK: - REDUCE
struct Family {
    var familyName: String
    var members: [Person]
}
let family = Family(familyName: "Johnsons", members: [])
let actualFamily = names.reduce(family) { currentFamily, name in
    var currentFamily = currentFamily
    let person = Person(name: name)
    currentFamily.members.append(person)
    return currentFamily
}

// MARK: SORT

func namesAreInAscendingOrder(first: String, second: String) -> Bool {
    return first < second
}

let sortedNames = names.sorted(by: namesAreInAscendingOrder)



// Cell Example
//protocol CellDelegate {
//    func buttonWasTapped() -> Void
//}

class Cell: UITableViewCell {
    let button: UIButton! = nil
//    var delegate: CellDelegate?
    var buttonTappedClosure: (() -> Void)?
//    var buttonTappedClosure: (_ cell: Cell) -> Void

    func buttonTapped() {
//        delegate?.buttonWasTapped()
        buttonTappedClosure?()
    }
}


class TableViewController: UITableViewController/*, CellDelegate */ {
    var someCellButtonWasTapped = false

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Cell()

//        cell.delegate = self
        cell.buttonTappedClosure = {
            print(indexPath.row)
            self.someCellButtonWasTapped.toggle()
        }

        return cell
    }

//    func buttonWasTapped() {
//        someCellButtonWasTapped.toggle()
//    }
}


// MARK: - Extension

let char: Character = "abcd".first!
let strChar = "\(char)" // make automatedish

extension Character {
    func stringValue() -> String {
        "\(self)"
    }
    var string: String {
        "\(self)"
    }

    static var invalidCharacter = "!"
}

char.stringValue()
char.string
let invalid = Character.invalidCharacter
Character.invalidCharacter = "#"



extension UIColor {
    static var successGreen: UIColor {
        return .green // unique color
    }
}

struct ColorPalette {
    static var successGreen: UIColor {
        return .green // unique color
    }
}

extension UIColor {

    struct Palette {
        static var successGreen: UIColor {
            return .green // unique color
        }
    }

    struct Button {
        static var lightGreen: UIColor {
            return .green // unique color
        }
        static var defaultBackground: UIColor {
            return .green // unique color
        }

        static var selectedBackground: UIColor {
            return .green // unique color
        }

        static var errorBackground: UIColor {
            return .green // unique color
        }

    }

}


let view = UIView()
view.backgroundColor = .Button.errorBackground
view.backgroundColor = .successGreen
view.backgroundColor = .Palette.successGreen
view.backgroundColor = ColorPalette.successGreen

extension DateFormatter {

    static var short: DateFormatter {
        .init()
    }

}


class ViewController1: UIViewController {
    let formatter = DateFormatter.short
}



extension String {
    func removeLast() {

    }

    func add(_ newString: String) {

    }
}

"mnyskjalksd".removeLast()
















func forwards(name1: String, name2: String) -> Bool {
    print(name1)
    print(name2)
    return name1 < name2
}
//:  Create a `[String]` collection using names of your friends and family. Call the collection's `sorted(by:)` function, passing in `forwards` as the argument. Store the result into `sortedCollection1`, then print the result. This should sort your collection alphabetically.


let fammily = ["Jake", "Lindsey", "Adam", "Ann"]

let sortedCollection1 = fammily.sorted(by: forwards)
print(sortedCollection1)

func forwaards(name1: String, name2: String) -> Bool {
    print(name1)
    print(name2)
    return name1 < name2
}
//:  Create a `[String]` collection using names of your friends and family. Call the collection's `sorted(by:)` function, passing in `forwards` as the argument. Store the result into `sortedCollection1`, then print the result. This should sort your collection alphabetically.
let collection = ["Jake", "britney", "connor", "bryan"]

let sortedColection1 = collection.sorted(by: forwaards)
print(sortedColection1)
