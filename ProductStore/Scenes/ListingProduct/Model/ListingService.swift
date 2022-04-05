//
//  OptionsService.swift
//  ProductStore
//
//  Created by Luan.Lima on 10/03/22.
//

import Foundation
import UIKit

protocol ProductListServiceProtocol{
    func fetchProductList(completion: (_ result: Result<[ListItemEntity], Error>) -> Void) }
        
class ProductListService: ProductListServiceProtocol {
    func fetchProductList(completion: (Result<[ListItemEntity], Error>) -> Void) {
        
        let item = ListItemEntity(image: "asd", name: "T-shirt Git hub", price: 65.00, installment: "6 x 10.00")
        let list =  (1...15).map{_ in item}
        completion(.success(list))
    } 
}

