//
//  MoviesRepository.swift
//  ProductList
//
//  Created by Madhu on 2019/12/20.
//  Copyright © 2019 Test. All rights reserved.
//


import Foundation

protocol ProductsRepository {
    func productsList(completion: @escaping (Result<[Product], Error>) -> Void)
}
