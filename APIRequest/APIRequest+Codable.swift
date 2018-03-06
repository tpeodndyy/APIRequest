//
//  APIRequest+Codable.swift
//  APIRequest
//
//  Created by Peera Kerdkokaew on 3/3/18.
//  Copyright © 2018 Peera Kerdkokaew. All rights reserved.
//

import UIKit

public extension APIRequest where ResponseType: Codable {
    
    func parse(data: Data) throws -> ResponseType? {
        return try JSONDecoder().decode(ResponseType.self, from: data)
    }
    
}

public extension APIRequest where Self: ParameterizeAPIRequest, Self.APIParameterType: Codable {
    
    var parameters: [String: Any] {
        guard let data = try? JSONEncoder().encode(apiParameter) else {
            return [:]
        }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap( { $0 as? [String: Any] } ) ?? [:]
    }
    
}
