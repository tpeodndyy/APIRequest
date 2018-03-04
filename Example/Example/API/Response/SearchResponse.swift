//
//  SearchResponse.swift
//  Example
//
//  Created by Peera Kerdkokaew on 4/3/18.
//  Copyright © 2018 Peera Kerdkokaew. All rights reserved.
//

import UIKit
import APIRequest

struct Post: Codable {
    
    enum CodingKeys: String, CodingKey {
        case userId
        case identifier = "id"
        case title
        case body
    }
    
    let userId: Int
    let identifier: Int
    let title: String
    let body: String
}
