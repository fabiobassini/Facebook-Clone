//
//  User.swift
//  Twitter
//
//  Created by Fabio Bassini on 24/07/21.
//

import Foundation
import UIKit

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let bioText: String
    let profileImage: URL
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case username
        case bioText = "bio"
        case profileImage = "profileImageUrl"
    }
}




struct Users: Codable {
    let users: [User]
}

