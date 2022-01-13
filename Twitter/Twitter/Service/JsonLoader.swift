//
//  LoadJsonData.swift
//  Twitter
//
//  Created by Fabio Bassini on 02/08/21.
//

import Foundation

class JSONLoader {
    
    static let shared = JSONLoader()
    
    func load<T: Decodable>(_ filename: String, fileExtension: String) -> T {
        
        guard let sourceFile = Bundle.main.url(forResource: filename, withExtension: fileExtension) else { fatalError("Could not find \(filename).\(fileExtension)") }
        
        guard let tweetData = try? Data(contentsOf: sourceFile) else { fatalError("Could not convert data") }
        
        let decoder = JSONDecoder()
        
        guard let values = try? decoder.decode(T.self, from: tweetData) else {
            fatalError("Error decoding data")
        }
        
        return values

    }
}


