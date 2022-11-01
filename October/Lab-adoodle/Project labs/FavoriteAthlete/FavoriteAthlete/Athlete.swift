//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by mac on 10/19/22.
//

import Foundation
struct Athlete {
    var name: String
    var age: Int
    var league: String
    var team: String
    
    var description: String {
        return "My fav \(name) is \(age) years old!! and plays for the \(team)! in the \(league)!! SOOOOOOO COOOOOL!!."
    }
}
