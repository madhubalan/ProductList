//
//  StoreService.swift
//  ProductList
//
//  Created by Madhu on 2019/12/21.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

protocol StorageService {
    typealias CompletionHandler<T> = (Result<T, Error>) -> Void
    func getObjects<T>(forId : String, completion : CompletionHandler<T>)
    func storeObject<T>(forId :T)
}

class DefaultStoreService : StorageService{
    func getObjects<T>(forId: String, completion: (Result<T, Error>) -> Void) {
        
    }
    
    func storeObject<T>(forId: T) {
        
    }
    
    
    
}

