//
//  Story.swift
//  Twitter
//
//  Created by Fabio Bassini on 24/08/21.
//

import Foundation


struct Story: Codable {
    
    var id: Int
    var imageName: URL
    
    init(nameOfModel model: User?) {
        self.id = model!.id
        self.imageName = model!.profileImage
    }
}
