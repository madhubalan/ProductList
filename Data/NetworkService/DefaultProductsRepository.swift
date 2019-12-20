//
//  DefaultMoviesRepository.swift
//  ProductList
//
//  Created by Madhu on 2019/12/20.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

class DefaultProductsRepository {

    let dataService : DataService

    init(dataService: DataService) {
        self.dataService = dataService
    }
}

extension DefaultProductsRepository: ProductsRepository {

    func productsList(completion: @escaping (Result<[Product], Error>) -> Void){
        
        self.dataService.request(with: APIEndpoints.fetchProducts.getPath(), completion: completion)
    }
}
