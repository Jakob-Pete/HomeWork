import UIKit

var greeting = "Hello, playground"


struct Point {
    var x: Int
    var y: Int
}

enum areas: CaseIterable {
    case north, east, south, west
}
func movements(arr: [Int]) -> (Int, Int) {
    var direction = 0
    var x = 0
    var y = 0

//    var point: Point()
    for (i, moves) in arr.enumerated() {
        switch areas.allCases[i%4] {
        case .north:
                x += moves
        case .east:
            y += moves
        case .south:
            x -= moves
        case .west:
            y -= moves
        }
        direction = (direction + 1) % 4
    }
    return (x,y)
}
print(movements(arr: [20,30,10,40]))
func trackRobot(movements: [Int]) -> (Int, Int) {
    var x = 0
    var y = 0
    var direction = 0

    for movement in movements {
        switch direction {
        case 0:
            y += movement
        case 1:
            x += movement
        case 2:
            y -= movement
        case 3:
            x -= movement
        default:
            break
        }
        direction = (direction + 1) % 4
    }

    return (x, y)
}
