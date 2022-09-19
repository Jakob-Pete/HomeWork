import UIKit

func distance(x1: Double, x2: Double, y1: Double, y2: Double) -> Double {
    return sqrt(((x1 - x2) * (x1 - x2)) + ((y1 - y2) * (y1 - y2)))
    
}
print(distance(x1: 1, x2: 2, y1: 3, y2: 4))


func dist(x1: Double, x2: Double, y1: Double, y2: Double) -> Double {
    sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2))
}
print(distance(x1: 1, x2: 2, y1: 3, y2: 4))
