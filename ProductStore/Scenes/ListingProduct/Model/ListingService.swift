//
//  OptionsService.swift
//  ProductStore
//
//  Created by Luan.Lima on 10/03/22.
//

import Foundation

protocol AvailableServiceListProtocol{
    func fetchAvailableOptions(id: String, completion: (_ result: Result<ListingItems, Error>) -> Void) }
    
    
class AvailableListService: AvailableServiceListProtocol {
    func fetchAvailableOptions(id: String, completion: (Result<ListingItems, Error>) -> Void) {
        completion(.success(ListingItems(imagem: "asd", nome: "T-shirt Git hub", preco: 59.99, parcelamento: "6 x 10.00")))
    }
    
    
    
    
}

