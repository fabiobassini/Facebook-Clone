//
//  HomeFeed.swift
//  Twitter
//
//  Created by Fabio Bassini on 02/08/21.
//

import Foundation

struct HomeFeed: Codable {
    let users: [User]
    let tweets: [Tweet]
}
