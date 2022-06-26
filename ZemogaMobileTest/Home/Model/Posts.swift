//
//  Posts.swift
//  ZemogaMobileTest
//
//  Created by Kevinho Morales on 26/6/22.
//

import Foundation

struct Posts: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    enum CodingKeys: CodingKey {
        case userId, id, title, body
    }
}
