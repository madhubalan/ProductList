//
//  FetchProducts.swift
//  ProductList
//
//  Created by Madhu on 2019/12/20.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

protocol FetchProductsUseCase {
    func execute(completion: @escaping (Result<[Product], Error>) -> Void)
}

final class DefaultFetchProductsUseCase : FetchProductsUseCase{
    
     private let productsRepository: ProductsRepository
    
    init(productsRepository: ProductsRepository) {
        self.productsRepository = productsRepository
    }
    
    func execute(completion: @escaping (Result<[Product], Error>) -> Void) {
        self.productsRepository.productsList { result in
            switch result {
            case .success:
                // do some db caching if needed
                completion(result)
            case .failure:
                completion(result)
            }
        }
    }
}

