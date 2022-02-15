//
//  ProductDetailViewModel.swift
//  ProductStore
//
//  Created by Yan Dias on 15/02/22.
//

import Foundation

protocol ProductDetailViewModelProtocol {
    // INPUT
    func fetchProductDetails(id: String)
    func changeColorTo(_ color: String)
    func changeSizeTo(_ size: String)
    func buyProduct()
    
    // OUTPUT
    var product: Product? { get }
    var onProductFetched: (() -> Void)? { get set }
    var onProductFetchError: (() -> Void)? { get set }
}

class ProductDetailViewModel: ProductDetailViewModelProtocol {
    
    //MARK: - Dependencies
    
    var productDetailService: ProductDetailServiceProtocol? = ProductDetailService()
    
    //MARK: - Properties
    
    var selectedColor: String?
    var selectedSize: String?
    
    //MARK: - ProductDetailViewModelProtocol conforms
    
    var product: Product?
    var onProductFetched: (() -> Void)?
    var onProductFetchError: (() -> Void)?
    
    func fetchProductDetails(id: String) {
        productDetailService?.fetchProductDetails(id: id, completion: { result in
            switch result {
            case .success(let product):
                self.product = Product(entity: product)
                onProductFetched?()
            case .failure:
                onProductFetchError?()
            }
        })
    }
    
    func changeColorTo(_ color: String) {
        selectedColor = color
    }
    
    func changeSizeTo(_ size: String) {
        selectedSize = size
    }
    
    func buyProduct() {
        
    }
}
