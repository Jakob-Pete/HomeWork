//
//  DogInfoView.swift
//  API(Project)
//
//  Created by mac on 12/5/22.
//
import UIKit
import Foundation
class DogInfoController {
    
    enum PhotoInfoError: Error, LocalizedError {
        case itemNotFound
        case imageDataMissing
    }
    
    func fetchImage(from url: URL) async throws -> UIImage {
        let john = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = john.1 as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw PhotoInfoError.imageDataMissing
        }
        
        guard let image = UIImage(data: john.0) else {
            throw PhotoInfoError.imageDataMissing
        }
        return image
    }
    
    func fetchPhotoInfo() async throws -> DogInfo {
        var urlComponents = URL(string: "https://dog.ceo/api/breeds/image/random")!
        
        //        urlComponents.queryItems = [
        //            "zip": "84043",
//                     "output": "json"
        //        ].map { URLQueryItem(name: $0.key, value: $0.value)
        //
        //        }
        do {
            
            let (data, response) = try await URLSession.shared.data(from: urlComponents)
            
            guard let htppResponse = response as? HTTPURLResponse,
                  htppResponse.statusCode == 200 else {
                throw PhotoInfoError.itemNotFound
            }
            let jsonDecoder = JSONDecoder()
            let photoInfo = try jsonDecoder.decode(DogInfo.self, from: data)
            return (photoInfo)
        } catch {
            throw error
        }
    }
}
