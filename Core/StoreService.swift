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
    func getObjects<T>(forKey : String, completion : CompletionHandler<T>)
    func storeObject<T>(object :T, forKey : String)
}

class DefaultStoreService : StorageService{
    func getObjects<T>(forKey: String, completion: (Result<T, Error>) -> Void) {
        let userDefaults = UserDefaults.standard
        if let decoded  = userDefaults.data(forKey: forKey), let decodedData = NSKeyedUnarchiver.unarchiveObject(with: decoded) as?  T{
             completion(.success(decodedData))
        }
        else{
            // Handle with proper error types
//            completion(.failure(Error)
        }
    }
    
    func storeObject<T>(object: T, forKey : String) {
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: object)
        userDefaults.set(encodedData, forKey: forKey)
        userDefaults.synchronize()
    }
    
    
    
}

