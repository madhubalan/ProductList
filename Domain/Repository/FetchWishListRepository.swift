//
//  FetchWishListRepository.swift
//  ProductList
//
//  Created by Madhu on 2019/12/21.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

protocol FetchWishListRepository {
   func wishList(completion: @escaping (Result<[wishListItem], Error>) -> Void)
   func modifyWishList(wishList: [wishListItem])
}
