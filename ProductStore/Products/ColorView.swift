//
//  ColorView.swift
//  ProductStore
//
//  Created by Luan.Lima on 06/02/22.
//

import UIKit


class ColorView: UIView {
    
    // MARK: Properties
    
    let color: UIColor
    
    // MARK: Init
    
    init(color:UIColor) {
        self.color = color
        super.init(frame: .zero)
        self.setupColorView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Functions
    
    private func setupColorView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = color
        
        heightAnchor.constraint(equalToConstant: 40).isActive = true
        widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        layer.cornerRadius = 40/2
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
    }
}

