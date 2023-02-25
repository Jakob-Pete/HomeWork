//
//  ContollerEOL.swift
//  Life-FormSearch
//
//  Created by mac on 1/31/23.
//

import UIKit

extension Data {
    func prettyPrintedJSONString() {
        guard
            let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []),
            let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
            let prettyJSONString = String(data: jsonData, encoding: .utf8) else {
                print("Failed to read JSON Object.")
                return
        }
        print(prettyJSONString)
    }
}

class ControllerEOL {
    
    static let shared = ControllerEOL()
    
    func sendRequest<Request: APIRequest>(_ request: Request) async throws -> Request.Response {
        let (data, response) = try await URLSession.shared.data(for: request.urlRequest)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw APIResquestError.itemNotFound
        }
        
        let decodedResponse = try request.decodeResponse(data: data)
        return(decodedResponse)
    }
}
