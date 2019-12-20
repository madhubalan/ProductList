//
//  ProductListViewModel.swift
//  ProductList
//
//  Created by Madhu on 2019/12/20.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

class ProductListViewModel: NSObject {
    
    let items: [Product]? = nil
    let error : String? = nil
    let productListUseCase : FetchProductsUseCase
    typealias completionHandler = (Result<[Product], Error>) -> Void
    
    init(productListUseCase : FetchProductsUseCase) {
        self.productListUseCase = productListUseCase
    }
    
    func loadProducts(completion : @escaping completionHandler){
        self.productListUseCase.execute(completion: completion)
        }
}

