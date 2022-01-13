//
//  Tweet.swift
//  Twitter
//
//  Created by Fabio Bassini on 26/07/21.
//

import Foundation

struct Tweet: Codable {
    let user: User
    let tweetImage: TweetImage
    let message: String
    
    private enum CodingKeys: String, CodingKey {
        case user, tweetImage = "TweetImage", message = "Message"
    }
}


struct TweetImage: Codable {
    let width: Int
    let height: Int
    let ImageUrl: String
}

struct Tweets: Codable {
    let tweets: [Tweet]
}
