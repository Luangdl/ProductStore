//
//  ColorsView.swift
//  ProductStore
//
//  Created by Luan.Lima on 06/02/22.
//

import UIKit

class ColorsView: UIView {
    
    //MARK: UI
    
    lazy var ColorsView: [ColorView] = {
        let views: [ColorView] = colors.map { color in
            let colorsView = ColorView(color: color)
            return colorsView
        }
        return views
    }()
    
    //MARK: Properties
    
    let colors: [UIColor]
    
    //MARK: Init
    
    init(colors: [UIColor]) {
        self.colors = colors
        super.init(frame: .zero)
        setupColorView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Properties
    
    private func setupColorView () {
        
        let stackViewColor1 = UIStackView()
        stackViewColor1.axis = .horizontal
        stackViewColor1.addArrangedSubview(ColorsView[0])
        stackViewColor1.addArrangedSubview(ColorsView[1])
        stackViewColor1.addArrangedSubview(ColorsView[2])
        stackViewColor1.addArrangedSubview(ColorsView[3])
        
        addSubview(stackViewColor1)
        
        stackViewColor1.translatesAutoresizingMaskIntoConstraints = false
        stackViewColor1.spacing = 20
        
        stackViewColor1.distribution = .fillEqually
        stackViewColor1.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackViewColor1.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        stackViewColor1.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackViewColor1.topAnchor.constraint(equalTo: topAnchor) .isActive = true
    }
}

