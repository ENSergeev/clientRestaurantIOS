//
//  Product.swift
//  RestaurantIOS
//
//  Created by Evgeniy Sergeev on 18.04.2023.
//

import Foundation
struct Product: Identifiable {
    var id: String
    var title: String
    var price: Int
    var description: String
    var imageUrl: String?
}
