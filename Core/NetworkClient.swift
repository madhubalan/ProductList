//
//  NetworkClient.swift
//  ProductList
//
//  Created by Madhu on 2019/12/20.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit


enum APIEndpoints {
    case fetchProducts
    
    func getPath() -> String {
        switch self {
        case .fetchProducts:
            return "http://www.mocky.io/v2/5dfb59e72f00006200ff9e80"
        }
    }
}

public protocol NetworkService {
    typealias CompletionHandler = (Result<Data?, Error>) -> Void
    func request(request: URLRequest, completion: @escaping CompletionHandler)
}

class NetworkClient: NetworkService {
    
    typealias CompletionHandler = (Result<Data?, Error>) -> Void
    
     var defaultSession : URLSession

       init(_ urlSession : URLSession) {
           self.defaultSession = urlSession
    }
    
    func request(request: URLRequest, completion: @escaping CompletionHandler){
        let sessionDataTask =  self.defaultSession.dataTask(with: request)  { data, response, requestError in
            
            if let requestError = requestError {
                           completion(.failure(requestError))
                       } else {
                           completion(.success(data))
                       }
        
        }
        
        sessionDataTask.resume()
    }
}
