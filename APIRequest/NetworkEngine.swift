//
//  NetworkEngine.swift
//  APIRequest
//
//  Created by Peera Kerdkokaew on 4/3/18.
//  Copyright © 2018 Peera Kerdkokaew. All rights reserved.
//

import UIKit

public enum NetworkError: Error {
    
    case requestInitialationFailed
    case parsingResponseFailed
    case unknown
    
    init?(response: URLResponse?, error: Error?) {
        guard let _ = error else {
            return nil
        }
        self = .unknown
    }
    
}

public struct NetworkEngineNotification {
    public static let activityStart = "NetworkEngineNotification.activityStart"
    public static let activityEnd = "NetworkEngineNotification.activityEnd"
}

public protocol NetworkEngine {
    
    func notifyNetworkActivityStart()
    func notifyNetworkActivityEnd()
    func send<T: APIRequest>(apiRequest: T,
                             completion: @escaping ((_ response: T.ResponseType?, _ error: NetworkError?) -> Void))
    func handleCompletion<T: APIRequest>(of request: T, data: Data?, response: URLResponse?, error: Error?,
                                         completion: ((_ response: T.ResponseType?, _ error: NetworkError?) -> Void))
    
}

extension NetworkEngine {
    
    public func notifyNetworkActivityStart() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: NetworkEngineNotification.activityStart), object: nil)
    }
    
    public func notifyNetworkActivityEnd() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: NetworkEngineNotification.activityEnd), object: nil)
    }
    
    public func handleCompletion<T: APIRequest>(of request: T, data: Data?, response: URLResponse?, error: Error?,
                                         completion: ((_ response: T.ResponseType?, _ error: NetworkError?) -> Void)) {
        notifyNetworkActivityEnd()
        if let error = NetworkError(response: response, error: error) {
            completion(nil, error)
        } else if let data = data,
            let apiResponse = try? request.parse(data: data) {
            completion(apiResponse, nil)
        } else {
            completion(nil, .parsingResponseFailed)
        }
    }
    
}
