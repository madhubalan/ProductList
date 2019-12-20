//
//  DefaultPosterImagesRepository.swift
//  ProductList
//
//  Created by Madhu on 2019/12/21.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

final class DefaultPosterImagesRepository {
    
   let dataService : DataService

    init(dataService: DataService) {
        self.dataService = dataService
    }
}

extension DefaultPosterImagesRepository: PosterImagesRepository {
    func image(with imagePath: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let endpoint = imagePath
         self.dataService.request(with:endpoint, completion: completion)
    }
}
