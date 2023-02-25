//
//  DogInfo.swift
//  API(Project)
//
//  Created by mac on 12/2/22.
//

import Foundation


struct DogInfo: Codable {
    var image: URL
   
//    Could probably just use the message instead of image and the image = message.
    enum CodingKeys: String, CodingKey {
        case image = "message"
      
    }
}
