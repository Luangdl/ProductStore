//
//  OptionsViewModel.swift
//  ProductStore
//
//  Created by Luan.Lima on 10/03/22.
//

import Foundation

protocol ListViewModelProtocol {
    func getListProduct()
    
    var itemList: [ListItem]? { get }
    var onListingFound: (() -> Void)? { get set }
    var onListingError: (() -> Void)? { get set }
}

class ListViewModel: ListViewModelProtocol {
    
   //MARK: - Dependencies
    
    var listingService: ProductListServiceProtocol = ProductListService()
    
    //MARK: -AvailableServiceListProtocol conforms
    var itemList: [ListItem]?
    var onListingError: (() -> Void)?
    var onListingFound: (() -> Void)?
    
    func getListProduct() {
        listingService.fetchProductList { result in
            switch result {
            case .success(let listing):
                self.itemList = listing.map { item in ListItem(items: item) }
                    onListingFound?()
            case .failure:
                onListingError?()
            }
        }
    }
}
    
                            
