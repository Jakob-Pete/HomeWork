//
//  EOLFetchPhoto.swift
//  Life-FormSearch
//
//  Created by mac on 1/20/23.
//

import Foundation
struct EOLFetchItem: Codable {
    var name: String
    var scientificName: String
    var id: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "content"
        case scientificName = "title"
        case id
        
    }
}

    struct SearchResponse: Codable {
        let results: [EOLFetchItem]
    }
