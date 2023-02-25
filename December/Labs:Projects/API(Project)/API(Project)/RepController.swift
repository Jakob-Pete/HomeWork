//
//  RepController.swift
//  API(Project)
//
//  Created by mac on 12/7/22.
//

import Foundation
class RepController {
    enum StoreItemError: Error, LocalizedError {
        case itemNotFound
    }
    
//   let controller = RepTableViewController()
    
    func fetchItems(matching query: [String: String]) async throws -> [Rep] {
        var urlComponents = URLComponents(string:"https://whoismyrepresentative.com/getall_mems.php?")!
        urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//            await controller.repsFailed()
            throw StoreItemError.itemNotFound
        }
//        await controller.repsSucceeded()
        let decoder = JSONDecoder()
        let searchResponse = try decoder.decode(Results.self, from: data)
        print(searchResponse)
        return searchResponse.results
    }
    
}
