//
//  UserDefaultStorage.swift
//  ProductList
//
//  Created by Madhu on 2019/12/20.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation


class DefaultWishListRepository {

    let storeService : StorageService

    init(storeService : StorageService) {
        self.storeService = storeService
    }
}

extension DefaultWishListRepository: FetchWishListRepository  {
    
//    func addToWishList(wishList: [wishListItem]) {
//        <#code#>
//    }
//
//    func removeFromWishList(productId: String) {
//        <#code#>
//    }
    
  
//    func wishList(completion: @escaping (Result<[wishListItem], Error>) -> Void) {
//        self.storeService.getObjects(forKey: "wishList", completion: completion)
//    }
//
//    func modifyWishList(wishList: [wishListItem]) {
//        self.storeService.storeObject(object:wishList, forKey: "wishList")
//    }
}
