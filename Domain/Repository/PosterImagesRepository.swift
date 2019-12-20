//
//  PosterImagesRepository.swift
//  ProductList
//
//  Created by Madhu on 2019/12/21.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

protocol PosterImagesRepository {
    func image(with imagePath: String, completion: @escaping (Result<Data, Error>) -> Void)
}



