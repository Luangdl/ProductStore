//
//  ProductDetailModel.swift
//  ProductStore
//
//  Created by Yan Dias on 15/02/22.
//

import Foundation

struct ProductEntity {
    let name: String
    let price: Double
    let colors: [String]
    let sizes: [String]
    let detail: String
    let images: String
}

struct Product {
    let name: String
    let price: String
    let colors: [String]
    let sizes: [String]
    let detail: String
    let images: String
    
    init(entity: ProductEntity) {
        self.name = entity.name
        self.price = "R$ \(entity.price)"
        self.colors = entity.colors
        self.sizes = entity.sizes
        self.detail = entity.detail
        self.images = entity.detail
    }
}
