//
//  ProductOptionsModel.swift
//  ProductStore
//
//  Created by Luan.Lima on 10/03/22.
//

import Foundation

struct ListItemEntity {
    let image: String
    let name: String
    let price: Double
    let installment: String
    
}

struct ListItem {
    let image: String
    let name: String
    let price: String
    let installment: String
    
    init(items: ListItemEntity) {
        self.image = items.image
        self.name = items.name
        self.price = "R$ \(items.price)"
        self.installment = items.installment
    }
}

