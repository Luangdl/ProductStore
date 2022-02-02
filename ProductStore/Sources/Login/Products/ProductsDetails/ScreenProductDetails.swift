//
//  ScreenProductDetails.swift
//  ProductStore
//
//  Created by Luan Gomes on 02/02/22.
//

import UIKit

class ScreenProductDetails: UIView {
    
    //MARK: UI

    lazy var button: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .green
        view.layer.cornerRadius = 20
        view.setTitle("Comprar agora", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var productDetails: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .white
        view.text = ("Detalhes do produto")
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: Properties
    
    
    
    // MARK: Init
    
    init() {
        super.init(frame:.zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    //MARK 

extension ScreenProductDetails: ViewCode{
 
    func buildViewHierarchy() {
        addSubview(button)
        addSubview(productDetails)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            
               button.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 67),
               button.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -68),
               button.heightAnchor.constraint(equalToConstant: 45),
               button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -180),
              
               
               productDetails.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
               productDetails.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -98),
               productDetails.heightAnchor.constraint(equalToConstant: 25),
               productDetails.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -280),
        
        ])
        

    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .black
    }
    
    

}
