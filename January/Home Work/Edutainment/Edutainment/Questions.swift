//
//  answers.swift
//  Edutainment
//
//  Created by mac on 1/18/23.
//

import Foundation

struct Question {
    var firstNumber: Int
    var secondNumber: Int
    let incorectAnswers: [Int]
    
    var corectAnswer: Int {
        firstNumber * secondNumber
    }
    
    
    
    var allAnswers: [Int] {
        incorectAnswers + [corectAnswer]
    }
    
    
    init(max: Int) {
        firstNumber = Int.random(in: 2...max)
        secondNumber = Int.random(in: 2...max)
        incorectAnswers = Question.incorectAnswersArr(max: max)
    }
    
    
    static func incorectAnswersArr(max: Int) -> [Int] {
        let wrongAnswer1 = Int.random(in: 2...max) * Int.random(in: 2...max)
        let wrongAnswer2 = Int.random(in: 2...max) * Int.random(in: 2...max)
        let wrongAnswer3 = Int.random(in: 2...max) * Int.random(in: 2...max)
        
        var allWrongArr = [wrongAnswer1, wrongAnswer2, wrongAnswer3]
        while(!isDifferent(allWrongArr) && max >= 2) {
            allWrongArr.removeFirst()
            
            allWrongArr.append(Int.random(in: 2...max))
        }
        return allWrongArr
    }
    
    static func retriveNums(max: Int) -> [Int] {
        let wrongAnswer1 = Int.random(in: 2...max) * Int.random(in: 2...max)
        let wrongAnswer2 = Int.random(in: 2...max) * Int.random(in: 2...max)
        let wrongAnswer3 = Int.random(in: 2...max) * Int.random(in: 2...max)
        
        return [wrongAnswer1, wrongAnswer2, wrongAnswer3]
    }
    
    static func isDifferent(_ arr: [Int]) -> Bool {
        var copy = arr
        
        for number in copy {
            copy.removeFirst()
            if copy.contains(number) {
                return false
            }
        }
        return true
    }
    
}
