//
//  GetUser.swift
//  Code Challenge 2# FindUserUpdated
//
//  Created by mac on 2/28/23.
//

import Foundation
import UIKit
class GetUser {
    enum UserError: Error, LocalizedError {
        case couldNotLoadUser
        case couldNotGetUser
    }
    //    To make sure we know where an error is
    func fetchItems(matching query: [String: String]) async throws -> [User] {
        var urlComponents = URLComponents(string: "\(API.url)")
        
        
        urlComponents?.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
        print(urlComponents?.url)
        let (data, response) = try await URLSession.shared.data(from: (urlComponents?.url!)!)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw UserError.couldNotGetUser
        }
        
        let decoder = JSONDecoder()
        print(urlComponents!.url!)
        print(String(data: data, encoding: .utf8)!)
        
        struct Result: Codable {
            var results: [User]
        }
        
        let result = try decoder.decode(Result.self, from: data)
        
        return result.results
    }
}
