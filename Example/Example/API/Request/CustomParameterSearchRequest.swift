//
//  CustomParameterSearchRequest.swift
//  Example
//
//  Created by Peera Kerdkokaew on 6/3/18.
//  Copyright © 2018 Peera Kerdkokaew. All rights reserved.
//

import UIKit
import APIRequest

struct CustomParameterSearchRequest: MyAPIRequest, ParameterizeAPIRequest {
    
    typealias APIParameterType = SearchOption
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
    
    var apiParameter: SearchOption?
    
    init(searchOption: SearchOption) {
        self.apiParameter = searchOption
    }
    
    
}
