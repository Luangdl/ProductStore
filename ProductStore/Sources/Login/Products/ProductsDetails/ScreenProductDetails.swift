//
//  ScreenProductDetails.swift
//  ProductStore
//
//  Created by Luan Gomes on 02/02/22.
//

import UIKit

class ScreenProductDetails: UIView {
    
    // MARK: Properties
    
    lazy var image = UIImage(systemName: "xmark.circle")
    
    var color: [UIColor] = [.white, .blue, .green, .yellow]
    
    var sizes1: [String] = ["PP","P","M"]
    var sizes2: [String] = ["G","GG","XG"]
    
    //MARK: UI

    lazy var imageView2: UIImageView = {
        let image = UIImageView(image: image)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var installmentValue: UILabel = {
       let label = UILabel()
        label.text = "3x de 60,00"
        label.font = label.font.withSize(11)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    lazy var productValue: UILabel = {
       let label = UILabel()
        label.text = "R$ 60,00"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    lazy var imageCollection: ImagesCollectionView = {
        let view = ImagesCollectionView()
        return view
    }()
    
    lazy var productName: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.text = "T-Shirt Git hub"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var colorName: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.text = "Cor: Branca"          //("Cor: \(color)")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var buttonCollor: ColorsView = {
        let button = ColorsView(colors: color)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    lazy var button1Size: SizesView = {
        let button1 = SizesView(sizes: sizes1)
        button1.translatesAutoresizingMaskIntoConstraints = false
        return button1
    }()
    
    lazy var button2Size: SizesView = {
        let button2 = SizesView(sizes: sizes2)
        button2.translatesAutoresizingMaskIntoConstraints = false
        return button2
    }()
    
    lazy var buttonSelectSize: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.text = ("Selecione um tamanho")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var productDetails: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .white
        view.text = ("Detalhes do produto")
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var buttonBuyNow: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 20
        view.setTitle("Comprar agora", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var buttonStart: UITabBar = {
        let button = UITabBar(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    } ()
    
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
        addSubview(imageView2)
        addSubview(installmentValue)
        addSubview(productValue)
        addSubview(productName)
        addSubview(colorName)
        addSubview(buttonCollor)
        addSubview(buttonSelectSize)
        addSubview(button1Size)
        addSubview(button2Size)
        addSubview(productDetails)
        addSubview(buttonBuyNow)
        addSubview(buttonStart)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            imageView2.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView2.rightAnchor.constraint(equalTo: rightAnchor),
            imageView2.heightAnchor.constraint(equalToConstant: 40),
            imageView2.widthAnchor.constraint(equalToConstant: 40),
            
            installmentValue.leftAnchor.constraint(equalTo: leftAnchor, constant: 298),
            installmentValue.topAnchor.constraint(equalTo: productValue.bottomAnchor, constant: 4),
            installmentValue.centerXAnchor.constraint(equalTo: productValue.centerXAnchor, constant: 4),
            
            productValue.leftAnchor.constraint(equalTo: leftAnchor, constant: 291),
            productValue.bottomAnchor.constraint(equalTo: colorName.topAnchor, constant: -40),
            
            productName.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            productName.bottomAnchor.constraint(equalTo: colorName.topAnchor, constant: -40),
            
            colorName.centerXAnchor.constraint(equalTo: centerXAnchor),
            colorName.bottomAnchor.constraint(equalTo: buttonCollor.topAnchor, constant: -24),
            
            buttonCollor.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonCollor.bottomAnchor.constraint(equalTo: buttonSelectSize.topAnchor, constant: -32),
            buttonCollor.leftAnchor.constraint(equalTo: leftAnchor, constant: 100),
            
            buttonSelectSize.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonSelectSize.bottomAnchor.constraint(equalTo: button1Size.topAnchor, constant: -28),
            
            button1Size.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            button2Size.centerXAnchor.constraint(equalTo: button1Size.centerXAnchor),
            button2Size.topAnchor.constraint(equalTo: button1Size.bottomAnchor),
            
            productDetails.topAnchor.constraint(equalTo: button2Size.bottomAnchor, constant: 51),
            productDetails.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            
            buttonBuyNow.topAnchor.constraint(equalTo: productDetails.bottomAnchor, constant: 47),
            buttonBuyNow.leftAnchor.constraint(equalTo: leftAnchor, constant: 67),
            buttonBuyNow.rightAnchor.constraint(equalTo: rightAnchor, constant: -67),
            buttonBuyNow.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -133),
            buttonBuyNow.heightAnchor.constraint(equalToConstant: 45),
            
            buttonStart.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 38),
            buttonStart.topAnchor.constraint(equalTo: buttonBuyNow.bottomAnchor, constant: 85),
            buttonStart.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24),
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .black
    }
}
