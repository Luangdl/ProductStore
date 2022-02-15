//
//  ScreenProductDetails.swift
//  ProductStore
//
//  Created by Luan Gomes on 02/02/22.
//

import UIKit

class ScreenProductDetails: UIView {
    
    // MARK: Properties
    
    lazy var image = UIImage(systemName: "bag")
    
    var color: [UIColor] = [.white, .blue, .green, .yellow]
    
    var sizes1: [String] = ["PP","P","M"]
    var sizes2: [String] = ["G","GG","XG"]
    
    //MARK: UI
    
    lazy var imageView: UIImageView = {
        
        var view = UILabel()

        view.frame = CGRect(x: 0, y: 0, width: 259.8, height: 297.14)

        view.backgroundColor = .white
        
        
            let imageView = UIImageView()
            imageView.image = UIImage(named: "camiseta")
 //           imageView.frame = CGRect(x: 0, y: 0, width: 259.8, height: 297.14)
            imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let layer0 = CALayer()

        layer0.contents = imageView

        layer0.bounds = view.bounds

        layer0.position = view.center

        view.layer.addSublayer(layer0)
        
            return imageView
            
        }()

    lazy var buttonBag: UIImageView = {
        let image = UIImageView(image: image)
        image.isUserInteractionEnabled = true
        addGestureRecognizer((UITapGestureRecognizer(target: self, action: #selector(didTapView))))
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
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(((UITapGestureRecognizer(target: self, action: #selector(didTapView)))))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonSelectSize: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.text = ("Selecione um tamanho")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var button1Size: SizesView = {
        let button1 = SizesView(sizes: sizes1)
        button1.isUserInteractionEnabled = true
        button1.addGestureRecognizer(((UITapGestureRecognizer(target: self, action: #selector(didTapView)))))
        button1.translatesAutoresizingMaskIntoConstraints = false
        return button1
    }()
    
    lazy var button2Size: SizesView = {
        let button2 = SizesView(sizes: sizes2)
        button2.isUserInteractionEnabled = true
        button2.addGestureRecognizer(((UITapGestureRecognizer(target: self, action: #selector(didTapView)))))
        button2.translatesAutoresizingMaskIntoConstraints = false
        return button2
    }()
    
    lazy var productDetails: UILabel = {
        let view = UILabel(frame: .zero)
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(((UITapGestureRecognizer(target: self, action: #selector(didTapView)))))
        view.textColor = .white
        view.text = ("Detalhes do produto")
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var buttonBuyNow: UIButton = {
        let view = UIButton(frame: .zero)
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(((UITapGestureRecognizer(target: self, action: #selector(didTapView)))))
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 20
        view.setTitle("Comprar agora", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: - Actions
    
    @objc func didTapView() {
        print("did tap view")
    }
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
        addSubview(imageView)
   //     addSubview(buttonBag)
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
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      //      imageView.bottomAnchor.constraint(equalTo: productValue.topAnchor, constant: 32),
            
        //    buttonBag.topAnchor.constraint(equalTo: topAnchor, constant: 35),
        //    buttonBag.leftAnchor.constraint(equalTo: leftAnchor, constant: 343),
        //    buttonBag.heightAnchor.constraint(equalToConstant: 40),
         //   buttonBag.widthAnchor.constraint(equalToConstant: 40),
            
            productValue.leftAnchor.constraint(equalTo: leftAnchor, constant: 291),
            productValue.bottomAnchor.constraint(equalTo: colorName.topAnchor, constant: -40),
            
            productName.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            productName.bottomAnchor.constraint(equalTo: colorName.topAnchor, constant: -40),
            
            installmentValue.leftAnchor.constraint(equalTo: leftAnchor, constant: 298),
            installmentValue.topAnchor.constraint(equalTo: productValue.bottomAnchor, constant: 4),
            installmentValue.centerXAnchor.constraint(equalTo: productValue.centerXAnchor, constant: 4),
            
            colorName.centerXAnchor.constraint(equalTo: centerXAnchor),
            colorName.bottomAnchor.constraint(equalTo: buttonCollor.topAnchor, constant: -24),
            
            buttonCollor.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonCollor.bottomAnchor.constraint(equalTo: buttonSelectSize.topAnchor, constant: -32),
            buttonCollor.leftAnchor.constraint(equalTo: leftAnchor, constant: 100),
            
            buttonSelectSize.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonSelectSize.bottomAnchor.constraint(equalTo: button1Size.topAnchor, constant: -24),
            
            button1Size.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            button2Size.centerXAnchor.constraint(equalTo: button1Size.centerXAnchor),
            button2Size.topAnchor.constraint(equalTo: button1Size.bottomAnchor),
            
            productDetails.topAnchor.constraint(equalTo: button2Size.bottomAnchor, constant: 47),
            productDetails.bottomAnchor.constraint(equalTo: buttonBuyNow.topAnchor, constant: -47),
            productDetails.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            
            buttonBuyNow.topAnchor.constraint(equalTo: productDetails.bottomAnchor, constant: 47),
            buttonBuyNow.leftAnchor.constraint(equalTo: leftAnchor, constant: 67),
            buttonBuyNow.rightAnchor.constraint(equalTo: rightAnchor, constant: -67),
            buttonBuyNow.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -123),
            buttonBuyNow.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .black
    }
}
