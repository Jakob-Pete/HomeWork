import UIKit

var greeting = "Hello, playground"
func imBetter(_ grades: [Double], myGrade: Double) -> Bool {
    
    return myGrade > (grades.reduce(0, +) / Double(grades.count))
    
    
}
imBetter([86,43,12,40.4,52], myGrade: 90)
