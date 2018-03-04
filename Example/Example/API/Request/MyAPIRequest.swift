//
//  MyAPIRequest.swift
//  Example
//
//  Created by Peera Kerdkokaew on 4/3/18.
//  Copyright © 2018 Peera Kerdkokaew. All rights reserved.
//

import UIKit
import APIRequest

enum MyAPIRequestPath: String {
    case getPost = "/posts"
}

protocol MyAPIRequest: APIRequest {
    var myAPIRequest: MyAPIRequestPath { get }
}

extension MyAPIRequest {
    
    var scheme: URLScheme {
        return .https
    }
    
    var host: String {
        return "jsonplaceholder.typicode.com"
    }
    
    var path: String {
        return myAPIRequest.rawValue
    }
    
    
    var cachePolicy: URLRequest.CachePolicy {
        return .reloadIgnoringLocalAndRemoteCacheData
    }
    
    var timeout: TimeInterval {
        return 20
    }
    
}
