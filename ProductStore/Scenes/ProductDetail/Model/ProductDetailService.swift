//
//  ProductDetailService.swift
//  ProductStore
//
//  Created by Yan Dias on 15/02/22.
//

import Foundation

protocol ProductDetailServiceProtocol {
    func fetchProductDetails(id: String, completion: (_ result: Result<ProductEntity, Error>) -> Void)
}

class ProductDetailService: ProductDetailServiceProtocol {
    func fetchProductDetails(id: String, completion: (Result<ProductEntity, Error>) -> Void) {
        completion(.success(
            ProductEntity(name: "T-shirt hub", price: 90.00, colors: ["a"], sizes: ["PP","P","M","G","GG","XG"], detail: "detail", images: "asd")
        ))
    }
}
