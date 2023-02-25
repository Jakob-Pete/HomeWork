import UIKit

var greeting = "Hello, playground"


    func isToday(todaysDate: Date) -> Bool {
        var calender = Calendar.current
        if calender.isDateInToday(todaysDate) {
            return true
        } else {  return false
        }
    }
isToday(todaysDate: )

func iToday(todaysDate: Date) -> Bool {
    return
    Calendar.current.isDateInToday(todaysDate)
}
iToday(todaysDate: Date())
