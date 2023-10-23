//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Sameer Ghauri on 20/09/2023.
//

import Foundation

struct MenuItem: Decodable {
    let title: String
    let descriptionText: String
    let price: String
    let image: String
    let category: String
    
    enum CodingKeys: String, CodingKey{
        case title = "title"
        case descriptionText = "description"
        case price = "price"
        case image = "image"
        case category = "category"
    }
}
