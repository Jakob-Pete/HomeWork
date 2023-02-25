import UIKit

var greeting = "Hello, playground"



func cleanUp(files: [String], method: String) -> [[String]] {
    if method == "prefix" {
        var prefixDict = [String: [String]]()
        for file in files {
            let prefix = file.split(separator: ".")[0]
            if prefixDict[String(prefix)] != nil {
                prefixDict[String(prefix)]!.append(file)
            } else {
                prefixDict[String(prefix)] = [file]
            }
        }
        return Array(prefixDict.values)
    } else if method == "suffix" {
        var suffixDict = [String: [String]]()
        for file in files {
            let suffix = file.split(separator: ".")[1]
            if suffixDict[String(suffix)] != nil {
                suffixDict[String(suffix)]!.append(file)
            } else {
                suffixDict[String(suffix)] = [file]
            }
        }
        return Array(suffixDict.values)
    }
    return [[]]
}
print(cleanUp(files: ["ex1.html", "ex1.js", "ex2.html", "ex2.js"], method: "prefix"))
print(cleanUp(files: ["ex1.html", "ex1.js", "ex2.html", "ex2.js"], method: "suffix"))




enum Sorting {
    case prefix
    case suffix

    func identifier(for filename: String) -> String {
        let parts = filename.split { $0 == "." }
        guard let filename = parts.first, let fileType = parts.last else {
            return "unknown"
        }
        switch self {
        case .suffix:
            return String(fileType)
        case .prefix:
            return String(filename)
        }
    }
}
/// This doesn't return the folders in any sort of organized order
func dictionaryCleanUp(_ files: [String], _ sorting: Sorting) -> [[String]] {
    var folders = [String: [String]]()
    for file in files {
        let folderName = sorting.identifier(for: file)
        folders[folderName, default: []].append(file)
    }
    return [[String]](folders.values)
}

// This is a fancier way of doing the above function
func fancyCleanUp(_ files: [String], _ sorting: Sorting) -> [[String]] {
    let folders = files.reduce(into: [String: [String]]()) { folders, file in
        folders[sorting.identifier(for: file), default: []].append(file)
    }
    return [[String]](folders.values)
}

// This keeps the order of the folders. (noticeable with the return of `cleanUp(["_1.rb", "_2.rb", "_3.rb", "_4.rb"], .prefix)`)
func fullOrderCleanUp(_ files: [String], _ sorting: Sorting) -> [[String]] {
    var folders = [(name: String, files: [String])]()
    for file in files {
        let folderName = sorting.identifier(for: file)
        if let index = folders.firstIndex(where: { $0.name == folderName }) {
            // folder exists, add file to folder
            folders[index].files.append(file)
        } else {
            // folder doesn't exist. Create a new folder.
            folders.append((folderName, [file]))
        }
    }
    return folders.map { $0.files }
}

// This is the same approach as the above function, but is more efficient.
func efficientFullOrderCleanUp(_ files: [String], _ sorting: Sorting) -> [[String]] {
    var folders = [(name: String, files: [String])]()
    /// Arrays are `O(n)` lookup, where `n` is the size of the Array. That means when I try to find a folder in my `folders` array by
    /// using `first(where:)`, it potenitally loops through ALL of the items in that array before it finds the correct folder.
    /// This is very inefficient.
    /// Dictionaries are `O(1)` lookup, so this variable allows me to get the index for a folder name
    /// without looping through all of the current folders.
    var folderIndexLookup = [String: Int]()
    for file in files {
        let folderName = sorting.identifier(for: file)
        if let index = folderIndexLookup[folderName] {
            // folder exists, add file to folder
            folders[index].files.append(file)
        } else {
            // folder doesn't exist. Create a new folder.
            folders.append((folderName, [file]))
            // add folder index to dictionary for quick `index` lookup
            folderIndexLookup[folderName] = folders.count - 1
        }
    }
    return folders.map { $0.files }
}


func cleanUp(_ files: [String], _ sorting: Sorting) -> [[String]] {
//    dictionaryCleanUp(files, sorting)
//    fancyCleanUp(files, sorting)
    fullOrderCleanUp(files, sorting)
}


cleanUp(["ex1.html", "ex1.js", "ex2.html", "ex2.js"], .prefix)
//➞ [
//    ["ex1.html", "ex1.js"],0
//    ["ex2.html", "ex2.js"]
//]


cleanUp(["ex1.html", "ex1.js", "ex2.html", "ex2.js"], .suffix)
//➞ [
//    ["ex1.html", "ex2.html"],
//    ["ex1.js", "ex2.js"]
//]

cleanUp(["music_app.js", "music_app.png", "music_app.wav", "tetris.png", "tetris.js"], .prefix)
//➞ [
//    ["music_app.js", "music_app.png", "music_app.wav"],
//    ["tetris.png", "tetris.js"]
//]

cleanUp(["_1.rb", "_2.rb", "_3.rb", "_4.rb"], .suffix)
//➞ [
//    ["_1.rb", "_2.rb", "_3.rb", "_4.rb"]
//]
//
cleanUp(["_1.rb", "_2.rb", "_3.rb", "_4.rb"], .prefix)
//➞ [
//    ["_1.rb"], ["_2.rb"],
//    ["_3.rb"], ["_4.rb"]
//]
