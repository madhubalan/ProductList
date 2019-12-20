//
//  Product+Decodable.swift
//  ProductList
//
//  Created by Madhu on 2019/12/20.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

extension Product: Decodable {
    
    private enum CodingKeys: String, CodingKey {
           case name
           case price
           case image
           
       }
    
    public init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
           self.name = try container.decode(String.self, forKey: .name)
           self.price = try container.decode(String.self, forKey: .price)
           self.image = try container.decodeIfPresent(String.self, forKey: .image)
       }
}
