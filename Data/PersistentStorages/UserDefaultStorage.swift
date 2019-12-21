//
//  UserDefaultStorage.swift
//  ProductList
//
//  Created by Madhu on 2019/12/20.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation


class DefaultWishListRepository {

    let storeService : StoreService

    init(storeService : StoreService) {
        self.storeService = storeService
    }
}

extension DefaultWishListRepository: FetchWishListRepository  {

    
}
