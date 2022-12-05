//
//  DogInfo.swift
//  API(Project)
//
//  Created by mac on 12/2/22.
//

import Foundation
import UIKit

struct Dog {
    var message: UIImage
    var status: String
    
    enum CodingKeys: String, CodingKey {
        case message
        case status
    }
}
