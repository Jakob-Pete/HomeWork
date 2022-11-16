import UIKit


// MARK: - Ways to Save Data to the Phone:
/// 1. Write to a file (this approach): File System, get URL to the file you save/read from, and then save/load data to that file.
/// 2. Core Data: iOS-specific saving mechanism, integrated into Xcode. A bit fancy and more involved.
/// 3. UserDefaults: Meant for smaller bits of data not large objects. Use this for things like: color theme preference or other things a user edits in a settings type UI. Also great for saving Bools that say whether a user has seen some alert or not like whether they've gone through the onboarding yet.

// MARK: JSON
/// JSON is essentially a `Dictionary` in `String` format.
/// If you take a `Data` that is JSON under the hood (see `dataObject` in step 1.1 below) and convert it to a `String` and print it, you'll see something similar to this:
///
///
///     { "People":
///         [
///            {
///              "Name" : "Ben"
///              "age": 30
///            },
///            {
///              "Name: "Josh"
///              "age": 23
///            }
///        ]
///     }
///




// MARK: - 1. Encoding an object (Swift Object -> JSON)

// MARK: 1.0 Make your Swift object conform to `Codable`
/// Note: Under the hood `Codable` just means `Decodable && Encodable`
/// So instead of `struct BallCount: Codable` you could say `struct BallCount: Decodable, Encodable` and it would act the EXACT same.
/// `Decodable`: Read from file, `Data -> BallCount`
/// `Encodable`: Save to file, `BallCount -> Data`
struct BallCount: Codable {
    var hr: Int
    var fiveMin: Int
    var min: Int
    /// Any variable of a custom-type (one you create, like `MaterialType`) MUST also conform to `Codable`
    var ballMaterial: MaterialType
}
// An example of a custom-type contained on the object I want to save to file.
// I also have to make this object conform to Codable.
enum MaterialType: Codable {
    case metal
    case plastic
    case moonRock
}

///      - 1.0.1 Create an object of your `Codable` type that you want to save to the device.
let currentBallCount = BallCount(hr: 8, fiveMin: 8, min: 0, ballMaterial: .metal)


// MARK: 1.1 Convert your Swift Object to JSON Data.
/// Initialize some sort of Encoder (`JSONEncoder` or `PropertyListEncoder`, I usually use JSONEncoder)
/// and encode your object to `Data` using that encoder.
/// Note: "JSON" is not an actual type in swift. It's just a format of `Data`.
let dataObject: Data = try! JSONEncoder().encode(currentBallCount)

// MARK: 1.2 Create a URL to the file you want to save/read from:
///     1. Create a URL Documents Directory
let documentsDirectory: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
/// _Will be something like: `/User/Bensiphone/documents/`
///     2. Add whatever file name we want to that documents directory URL.
let saveFileURL: URL = documentsDirectory.appendingPathComponent("BallCountData").appendingPathExtension("json")
/// _Will be something like: `/User/Bensiphone/documents/BallCountData.json`

// MARK: 1.3 Save data to file url
/// Need an object of type `Data` in order to save to a file.
do {
    try dataObject.write(to: saveFileURL)
} catch {
    print(error)
}

// MARK: 1.4 🎉🥳 DATA IS SAVED TO FILE! 🎉🥳




// MARK: - 2. Decoding an Object (JSON -> Swift Object)

// MARK: 2. Get the file URL to read your data from0:
/// _ see `saveFileURL` in 1.2 above

// MARK: 2.2 Get `Data` from file
let data: Data = try! Data(contentsOf: saveFileURL)

// MARK: 2.3 Decode our object
/// Create the **Same** kind of decoder as we did in step 1.1 above.
/// Use the decoder to decode the `data` gathered from the `saveFileURL` and turn it into some Swift object type (in this situation we're turning it into a `BallCount` object).
let newBallCount: BallCount = try JSONDecoder().decode(BallCount.self, from: data)

// MARK: 🍾👯‍♂️ 2.3 BALLCOUNT WAS CREATED FROM A FILE!!! 🍾👯‍♂️




// MARK: - Do/Catch/Try/Throws:

/// Apple has great docs on Error handling/`throws`, so check that out if you need more.
/// https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html
///
/// Here's what we talked about:
/// If a function `throws` you need to `try` it: `try someFunctionThatThrows()`
/// When you `try` something you need to do one of the following:
/// - 1. `try?`: This will return nil if an error is thrown. The object returned will thus be optional (in our case it would be type `Data?`). You'll then need to "unwrap" the optional using an `if let`.
/// - 2.  `try!`: This will crash if an error is thrown. The object returned isn't optional (in our case `Data`)
/// - 3. Wrap your `try` in a `do``catch` block. The benefit here is that you'll have access to the error thrown so you can debug it.
/// If your getting errors with something that `throws` then you **NEED** to use this approach.
///
///     do {
///          // execute some code that throws.
///          let myObject = try someFunctionThatThrows()
///          // Note: you only have access to myObject inside this block.
///      } catch { // you get a variable for free inside the `catch` block called `error`. Usually you just print that error so you can read what's going on if it throws an error.
///          print(error)
///      }
///

/// This is what a function signature looks like that throws. Note the `) throws -> ...`.
/// If a function throws that means it can exit early from the function if it runs into an error.
///
///     // We need an error type that we can throw
///     enum UserError: Error {
///         case noUserExists
///     }
///
///
///     func getName() throws -> String {
///         guard let currentUser = currentUser else {
///             throw UserError.noUserExists
///             // No need to `return` here because we `threw` an error.
///             // Throwing an error also satisfies the guard's requirement of leaving the function inside the else block.
///         }
///         return currentUser.name
///     }




///
///
///
///


// MARK: - Extras
//let object = try? encoder.encode(currentBallCount) // Data?
//if let object = object { // Data
//
//}
//if let object = try? encoder.encode(currentBallCount) {
//
//}
