//
//  CustomParameterSearchRequest.swift
//  Example
//
//  Created by Peera Kerdkokaew on 6/3/18.
//  Copyright © 2018 Peera Kerdkokaew. All rights reserved.
//

import UIKit
import APIRequest

struct CustomParameterSearchRequest: MyAPIRequest, CustomParameterAPIRequest {
    
    typealias CustomParameterType = SearchOption
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
    
    var customParameters: SearchOption? {
        get {
            return searchOption
        } set {
            
        }
    }
    
    let searchOption: SearchOption
    
    init(searchOption: SearchOption) {
        self.searchOption = searchOption
    }
    
    
}
