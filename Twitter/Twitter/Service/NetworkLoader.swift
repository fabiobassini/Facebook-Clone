//
//  NetworkLoader.swift
//  Twitter
//
//  Created by Fabio Bassini on 03/08/21.
//

import Foundation

class NetworkLoader {
    
    static let shared = NetworkLoader()
    
    
    func fetchHomeFeed<T: Decodable>(baseUrl: URL, completion: @escaping (T) -> Void) {
        
        URLSession.shared.dataTask(with: baseUrl) { data, resp, err in
            
            let jsonDecoder = JSONDecoder()
            
            guard let data = data, let users = try? jsonDecoder.decode(T.self, from: data) else {
                fatalError("Error decoding data")
            }
            
            completion(users)

            
        }.resume()
        
    }
    
}
