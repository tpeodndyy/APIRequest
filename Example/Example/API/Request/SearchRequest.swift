//
//  SearchRequest.swift
//  Example
//
//  Created by Peera Kerdkokaew on 4/3/18.
//  Copyright © 2018 Peera Kerdkokaew. All rights reserved.
//

import UIKit
import APIRequest

struct SearchOption: Codable {
    let userId: String
}

struct SearchRequest: MyAPIRequest {
    
    typealias ResponseType = Array<Post>
    
    var method: HTTPMethod {
        return .GET
    }
    
    var myAPIRequest: MyAPIRequestPath {
        return .getPost
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    var parameters: [String : String] {
        return ["userId": searchOption.userId]
    }
    
    let searchOption: SearchOption
    
    init(searchOption: SearchOption) {
        self.searchOption = searchOption
    }
    
    
}
