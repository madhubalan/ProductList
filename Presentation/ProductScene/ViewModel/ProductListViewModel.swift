//
//  ProductListViewModel.swift
//  ProductList
//
//  Created by Madhu on 2019/12/20.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

class ProductListViewModel: NSObject {
    
    private let posterImagesRepository: PosterImagesRepository
    
    var items: Observable<[PoductListItemViewModel]> = Observable([PoductListItemViewModel]())
    var error: Observable<String> = Observable("")
    
    let productListUseCase : FetchProductsUseCase
    
    typealias completionHandler = (Result<[PoductListItemViewModel], Error>) -> Void
    
    init(productListUseCase : FetchProductsUseCase, posterImagesRepository : PosterImagesRepository) {
        self.productListUseCase = productListUseCase
        self.posterImagesRepository = posterImagesRepository
    }
    
    func loadProducts(){
        self.productListUseCase.execute { [weak self] result in
            guard let welf = self else { return }
                              switch result {
                              case .success(let products):
                                welf.items.value = products.map {
                                PoductListItemViewModel(product: $0,
                                                        posterImagesRepository: welf.posterImagesRepository)}
                                
                              case .failure(let error):
                                welf.handle(error: error)
            }
        }
        }
    
    private func handle(error: Error) {
           self.error.value = NSLocalizedString("Failed loading Posters", comment: "")
       }
}

