//
//  RemoveFromWishList.swift
//  ProductList
//
//  Created by Madhu on 2019/12/20.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

protocol FetchFromWishList {

    func fetcWishList(completion:(@escaping (Result<[wishListItem], Error>) -> Void))
}

protocol UpdateWishList {
    func addToWishList(pid : String)
    func removeWishList(pid : String)
}


final class DefaultFetchFromWishListUseCase : FetchFromWishList, UpdateWishList {

     private let fetchWishListRepository: FetchWishListRepository
    
    init(fetchWishListRepository: FetchWishListRepository) {
        self.fetchWishListRepository = fetchWishListRepository
    }
    
    func fetcWishList(completion:(@escaping (Result<[wishListItem], Error>) -> Void)) {
        self.fetchWishListRepository.wishList(completion: completion)
    }
    
    func addToWishList(pid : String) {
        self.fetchWishListRepository.addToWishList(productId: pid)
    }
    
    func removeWishList(pid : String) {
        self.fetchWishListRepository.removeFromWishList(productId: pid)
    }
}



