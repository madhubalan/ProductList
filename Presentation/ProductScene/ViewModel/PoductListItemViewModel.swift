//
//  PoductListItemViewModel.swift
//  ProductList
//
//  Created by Madhu on 2019/12/20.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation




class PoductListItemViewModel: NSObject {
  
    
    
    let id: String
    let name: String?
    let price: String?
    var priceDispalyColor : String = "#000000"
    let desc: String?
    let posterPath: String?
    let posterImage: Observable<Data?> = Observable(nil)

    private let posterImagesRepository: PosterImagesRepository
    
    init(product: Product,
            posterImagesRepository: PosterImagesRepository) {
        self.id = product.pid
        self.name = product.name
        self.desc = product.desc
        self.price = (product.offerPrice != nil) ? product.offerPrice : product.price
        self.priceDispalyColor = (product.offerPrice != nil) ? "#ff0000" : "#000000"
        self.posterPath = product.image
        self.posterImagesRepository = posterImagesRepository
       }
    
    func didEndDisplaying() {
           posterImage.value = nil
      }
    
    func updatePosterImage() {
        posterImage.value = nil
        guard let posterPath = posterPath else { return }
        
        posterImagesRepository.image(with: posterPath) {  [weak self] result in
                       switch result {
                       case .success(let data):
                           self?.posterImage.value = data
                       case .failure: break
                       }
        }
    }
    

}
