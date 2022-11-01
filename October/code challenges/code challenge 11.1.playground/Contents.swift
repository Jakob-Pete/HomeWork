import UIKit

var greeting = "Hello, playground"





//func timeString(from ballCounts: (hr: Int, fiveMin: Int, min: Int)) -> String {
//
//
//
//
//
//    return "Algo"
//}

func timeString(from ballCounts: (hr: Int, fiveMin: Int, min: Int)) -> String {
    var minutes = ballCounts.min
    minutes += (ballCounts.fiveMin * 5)
    return "The current time is \(ballCounts.hr):\(minutes < 10 ? "0" + String(minutes) : String(minutes))"
}
print(timeString(from: (4, 5, 3)))


//non tuple way
struct BallCount {
    var hr: Int
    var fiveMin: Int
    var min: Int
}
func timeString(from ballCounts: BallCount) -> String {
    var minutes = ballCounts.min
    minutes += (ballCounts.fiveMin * 5)
    return "The current time is \(ballCounts.hr):\(minutes < 10 ? "0" + String(minutes) : String(minutes))"
}
