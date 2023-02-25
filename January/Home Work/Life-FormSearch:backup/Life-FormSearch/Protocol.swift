//
//  Protocal.swift
//  Life-FormSearch
//
//  Created by mac on 1/31/23.
//

import Foundation
protocol APIRequest {
    associatedtype Response

    var urlRequest: URLRequest { get }
    func decodeResponse(data: Data) throws -> Response
}
enum APIResquestError: Error {
    case itemNotFound
}
