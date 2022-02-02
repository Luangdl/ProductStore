//
//  Protocol.swift
//  ProductStore
//
//  Created by Luan Gomes on 02/02/22.
//

import Foundation

protocol ViewCode{
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewCode{
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
}
