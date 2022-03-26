//
//  ProductOptionsModel.swift
//  ProductStore
//
//  Created by Luan.Lima on 10/03/22.
//

import Foundation

struct ListingItems {
    let imagem: String
    let nome: String
    let preco: Double
    let parcelamento: String
    
}

struct Listing {
    let imagem: String
    let nome: String
    let preco: String
    let parcelamento: String
    
    init(items: ListingItems) {
        self.imagem = items.imagem
        self.nome = items.nome
        self.preco = "R$ \(items.preco)"
        self.parcelamento = items.parcelamento
    }
}

