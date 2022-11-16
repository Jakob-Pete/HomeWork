//
//  ScoreBoard.swift
//  ScoreKeeper
//
//  Created by mac on 11/3/22.
//

import Foundation

struct NewPlayer: Comparable {
   
    
    var playerName: String
    var currentScore: Int
    
    static func < (lhs: NewPlayer, rhs: NewPlayer) -> Bool {
        return lhs.currentScore < rhs.currentScore
    }
    
}
