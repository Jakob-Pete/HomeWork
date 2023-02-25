//
//  NumberContoller.swift
//  TDD Directory app
//
//  Created by mac on 1/3/23.
//

import Foundation
class NumberContoller {
 
    
    
    static func evenNumebers(arr:[Int]) -> [Int] {
       
       return arr.filter( { $0 % 2 == 0})
    }
}
