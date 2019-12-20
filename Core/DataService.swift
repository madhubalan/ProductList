//
//  DataService.swift
//  ProductList
//
//  Created by Madhu on 2019/12/20.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

protocol DataService {
    typealias CompletionHandler<T> = (Result<T, Error>) -> Void
    func request<T: Decodable>(with endpoint: String, completion: @escaping CompletionHandler<T>)
}

class DefaultDataService : DataService{
    
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    
    func request<T: Decodable>(with endpoint: String, completion: @escaping CompletionHandler<T>){
        
        if let url = URL(string: endpoint){
            let request = URLRequest(url: url)
            
            networkClient.request(request: request) { result in
                switch result {
                case .success(let data):
                    guard let data = data else { return }
                
                    if let data = data as? T, (type(of: data) == T.self){
                        DispatchQueue.main.async { completion(.success(data)) }
                    }
                    else{
                        do{
                            let result : T = try JSONDecoder().decode(T.self, from: data)
                            DispatchQueue.main.async { completion(.success(result)) }
                        } catch {
                            DispatchQueue.main.async { completion(.failure(error)) }
                        }
                    }
                    
                    
                case .failure(let error):
                    DispatchQueue.main.async { completion(.failure(error)) }
                }
            }
        }
    }
}

