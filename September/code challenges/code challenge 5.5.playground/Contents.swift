import UIKit
import Darwin
import Foundation

var greeting = "Hello, playground"
func getGrade(s1: Int, s2: Int, s3: Int) -> String {
    let aveg = (s1 + s2 + s3) / 3
    var returnThing = ""
    if aveg >= 90 && <=100 {
        print("A")
    } else if aveg >= 80 && <90 {
        print("B")
    } else if aveg >= 70 && <80 {
        print("C")
    } else if aveg >= 60 && <70 {
        print("D")
    } else if aveg <= 0 && <60 {
        print("F")
    } else { print("How'd you do this?")
    }
return
}

//func getGrade(s1: Int, s2: Int, s3: Int) -> String {
//    let ave = (s1 + s2 + s3) / 3
//    var returnMsg = ""
//    if ave >= 90 {
//        return "A"
//    } else if ave > 89 {
//        return "B"
//    } else if ave > 70 {
//        return "C"
//    } else if ave > 60 {
//        return "D"
//    }  else {
//        return "D"
//    }
//    }
//print(getGrade(s1: 94, s2: 80, s3: 98))
