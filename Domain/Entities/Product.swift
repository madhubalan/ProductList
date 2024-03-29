//
//  Product.swift
//  ProductList
//
//  Created by Madhu on 2019/12/20.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

struct Product : Codable {
    let pid : String
    let name: String?
    let price: String?
    let offerPrice : String?
    let desc: String?
    let image: String?
}
