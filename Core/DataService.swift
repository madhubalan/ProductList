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
    func request<T: Decodable>(with endpoint: String, completion: @escaping CompletionHandler<T>){
        // use DI with init
        let sessoin = URLSession(configuration: .default)
        let client = NetworkClient(sessoin)
        if let url = URL(string: NewsFeed.fetchProducts.getPath()){
            let request = URLRequest(url: url)
            
            client.request(request: request) { result in
                switch result {
                case .success(let data):
                    do {
                        print(String(decoding: data!, as: UTF8.self))
                        let result : T = try JSONDecoder().decode([Product].self, from: data!) as! T
                        DispatchQueue.main.async { completion(.success(result)) }
                    } catch {
                        DispatchQueue.main.async { completion(.failure(error)) }
                    }
                    
                case .failure(let error):
                    DispatchQueue.main.async { completion(.failure(error)) }
                }
            }
        }
    }
}

