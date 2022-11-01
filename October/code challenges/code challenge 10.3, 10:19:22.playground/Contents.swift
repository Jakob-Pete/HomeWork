import UIKit

var greeting = "Hello, playground"






func convertToDate(_ dateString: String) -> Date? {
   var dateCon = dateString
    let dateForConvert = DateFormatter()
    
    dateForConvert.dateFormat = "dd MMM yyyy HH:mm:ss"
    
                
                    
                
    return dateForConvert.date(from: dateCon)
}
convertToDate("18 September 4949 18:10:12 ")


