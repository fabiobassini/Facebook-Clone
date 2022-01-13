//
//  HomeNetworkExtension.swift
//  Twitter
//
//  Created by Fabio Bassini on 24/08/21.
//

import UIKit

class Helper: UIView {
    
    static let shared = Helper()
    
    
    public func fetchHomeFeed(completion: @escaping (HomeFeed?) -> Void) {

        guard let decodedValue: HomeFeed = JSONLoader.shared.load("JSONDatas", fileExtension: "json") else { return }
        print(decodedValue)

            
        completion(decodedValue)
        
        
        
    }
    
    
    public func fetchUsers(completion: @escaping ([User]?) -> Void) {
        

//        NetworkLoader.shared.fetchHomeFeed(baseUrl: baseUrl!) { (data: Users) in
//
//            if let decodedValue = data as? Users {
//                completion(decodedValue.users)
//            }
//        }
        
        guard let decodedValue: Users = JSONLoader.shared.load("JSONDatas", fileExtension: "json") else { return }
        
        completion(decodedValue.users)
        
    }
    
    
    public func fetchTweets(completion: @escaping ([Tweet]?) -> Void) {
        
        guard let decodedValue: Tweets = JSONLoader.shared.load("JSONDatas", fileExtension: "json") else { return }
        
        completion(decodedValue.tweets)
    }
}
