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
    let name: String
    let price: String
    let desc: String
    let image: String
    
    init(pid : String, name: String,  price: String, desc: String, image: String) {
        self.pid = pid
        self.name = name
        self.price = price
        self.image = image
        self.desc = desc
    }
}
