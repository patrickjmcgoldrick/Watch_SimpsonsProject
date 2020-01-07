//
//  NetworkController.swift
//  Watch_SimpsonsProject WatchKit Extension
//
//  Created by dirtbag on 12/26/19.
//  Copyright © 2019 dirtbag. All rights reserved.
//

import Foundation

class NetworkController {
    
    static let southParkCharacters = "https://api.duckduckgo.com/?q=south+park+characters&format=json"
    
    func getSouthParkCharacters(completion: @escaping ([Cast]?) -> Void) {
        
        let url = URL(string: NetworkController.southParkCharacters)
        
        guard let safeUrl = url else { return }
        
        let task = URLSession.shared.dataTask(with: safeUrl) { (data, response, error) in
            
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data {
                    
                    do {
                        let jsonDecoder = JSONDecoder()
                        
                        let relatedTopics = try jsonDecoder.decode(RelatedTopics.self, from: data)
                        
                        completion(relatedTopics.relatedTopics)
                        
                    } catch {
                        print("Error: \(error.localizedDescription)")
                    }
                }
            }
            
        }
        task.resume()
    }
    
}
