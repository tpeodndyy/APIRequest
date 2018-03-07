//
//  UrlSession+NetworkEngine.swift
//  APIRequest
//
//  Created by Peera Kerdkokaew on 4/3/18.
//  Copyright © 2018 Peera Kerdkokaew. All rights reserved.
//

import UIKit

extension URLSession: NetworkEngine {
    
    public func send<T>(apiRequest: T,
                        completion: @escaping ((T.ResponseType?, NetworkError?) -> Void)) where T : APIRequest {
        guard let urlRequest = apiRequest.urlRequest else {
            completion(nil, .requestInitialationFailed)
            return
        }
        notifyNetworkActivityStart()
        dataTask(with: urlRequest) { (data, response, error) in
            self.handleCompletion(of: apiRequest,
                                  data: data,
                                  response: response,
                                  error: error,
                                  completion: completion)
        }.resume()
    }
    
}
