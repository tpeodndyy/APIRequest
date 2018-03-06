//
//  APIRequest.swift
//  APIRequest
//
//  Created by Peera Kerdkokaew on 3/3/18.
//  Copyright © 2018 Peera Kerdkokaew. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case HEAD = "HEAD"
    case PUT = "PUT"
    case DELETE = "DELETE"
    case OPTIONS = "OPTIONS"
    case CONNECT = "CONNECT"
}

public enum URLScheme: String {
    case http = "http"
    case https = "https"
}

public protocol APIRequest {
    
    associatedtype ResponseType: APIResponse
    
    var scheme: URLScheme { get }
    var method: HTTPMethod { get }
    var host: String { get }
    var path: String { get }
    var headers: [String: String] { get }
    
    var encodedParametersData: Data? { get }
    var parameters: [String: Any] { get }
    
    var cachePolicy: URLRequest.CachePolicy { get }
    var timeout: TimeInterval { get }
    
    var urlRequest: URLRequest? { get }
    
    func parse(data: Data) throws -> ResponseType?
    
}

public extension APIRequest {
    
    var encodedParametersData: Data? {
        return try? JSONEncoder().encode(parameters)
    }
    
    var urlRequest: URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme.rawValue
        urlComponents.host = host
        urlComponents.path = path
        
        if method == .GET {
            urlComponents.queryItems = parameters.map( { URLQueryItem(name: $0.key, value: "\($0.value)") } )
        }
        
        guard let url = urlComponents.url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        if method == .POST, let httpBody = encodedParametersData {
            urlRequest.httpBody = httpBody
        }
        
        headers.forEach( { urlRequest.addValue($0.value, forHTTPHeaderField: $0.key) } )
        urlRequest.timeoutInterval = timeout
        return urlRequest
    }
    
}

public protocol ParameterizeAPIRequest {
    associatedtype APIParameterType
    var apiParameter: APIParameterType? { get set }
}

