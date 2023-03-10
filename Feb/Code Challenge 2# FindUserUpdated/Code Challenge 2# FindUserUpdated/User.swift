//
//  APIController.swift
//  Code Challenge 2# FindUserUpdated
//
//  Created by mac on 2/27/23.
//

import Foundation
import UIKit

struct User: Decodable, Encodable {
    var gender: String?
    var name: Name?

    var location: UserLocation?
    var email: String?
//    var login: String?
    var dob: UserDOB?
    var phone: String?
    var id: UserID?
    var picture: Picture?
    var registered: UserRegistration?
    var nationality: String?
}

struct UserLocation: Codable {
    var street: LocationStreet
    var city: String
}

struct LocationStreet: Codable {
    var number: Int
    var name: String
}

struct Coordinates: Codable {
    var longitude: String
    var latitude: String
}
struct Timezone: Codable {
    var offset: String
    var description: String
}
struct UserDOB: Codable {
    var date: String
    var age: Int
}

struct UserRegistration: Codable {
    var date: String
    var age: Int
}

struct UserID: Codable {
    var name: String?
    var value: String?
}

struct Picture: Codable {
    var large: String?
    var medium: String?
    var thumbnail: String?
}
struct Name: Codable {
    var first: String
    var last: String
}
