//
//  SizeView.swift
//  ProductStore
//
//  Created by Luan.Lima on 03/02/22.
//

import UIKit

class SizeView: UIView {
    
    // MARK: UI
    
    lazy var sizeLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = size
        return view
    }()
    
    // MARK: Properties
    
    let size: String
    
    private let heigh: CGFloat = 32
    private let width: CGFloat = 80
    private let borderWidth: CGFloat = 1
    
    // MARK: Init
    
    init(size:String) {
        self.size = size
        super.init(frame: .zero)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Functions
    
    private func setupView() {
        addSubview(sizeLabel)
        
        sizeLabel.translatesAutoresizingMaskIntoConstraints = false
        sizeLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        sizeLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        sizeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        heightAnchor.constraint(equalToConstant: heigh).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
        
        layer.cornerRadius = heigh/2
        layer.borderWidth = borderWidth
        layer.borderColor = UIColor.white.cgColor
    }
}
