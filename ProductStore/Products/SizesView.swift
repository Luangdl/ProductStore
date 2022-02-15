//
//  SizeViews.swift
//  ProductStore
//
//  Created by Luan.Lima on 03/02/22.
//

import UIKit

class SizesView: UIView {
    
    // MARK: UI
    
    lazy var sizeViews: [SizeView] = {
        let views: [SizeView] = sizes.map { size in
            let view = SizeView(size: size)
            return view
        }
        return views
    }()
    // MARK: Properties
    
    let sizes: [String]
    
    //MARK: Init
    
    init(sizes: [String]) {
        self.sizes = sizes
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Function
    
    private func setupView() {
        let stackView1 = UIStackView()
        stackView1.axis = .horizontal
        stackView1.addArrangedSubview(sizeViews[0])
        stackView1.addArrangedSubview(sizeViews[1])
        stackView1.addArrangedSubview(sizeViews[2])
        
        let stackView2 = UIStackView()
        stackView2.axis = .horizontal
        stackView2.addArrangedSubview(sizeViews[0])
        stackView2.addArrangedSubview(sizeViews[1])
        stackView2.addArrangedSubview(sizeViews[2])
        
        addSubview(stackView1)
        addSubview(stackView2)
        
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        
        stackView1.spacing = 20
        stackView2.spacing = 20
        
        stackView1.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView1.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView1.bottomAnchor.constraint(equalTo: stackView2.topAnchor, constant: -10).isActive = true
        stackView1.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        stackView2.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView2.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView2.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
