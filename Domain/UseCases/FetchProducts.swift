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


