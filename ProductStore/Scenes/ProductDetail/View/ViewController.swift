//
//  ViewController.swift
//  ProductStore
//
//  Created by Luan Gomes on 31/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    lazy var image = UIImage(systemName: "bag")
    
    var color: [UIColor] = [.white, .blue, .green, .yellow]
    
    var sizes1: [String] = ["PP","P","M"]
    var sizes2: [String] = ["G","GG","XG"]
    
    let productId: String
    
    var viewModel: ProductDetailViewModelProtocol? = ProductDetailViewModel()
    
    //MARK: UI
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(named: "camiseta")
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    lazy var buttonBag: UIImageView = {
        let image = UIImageView(image: image)
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer((UITapGestureRecognizer(target: self, action: #selector(didTapView))))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var installmentValue: UILabel = {
       let label = UILabel()
        label.font = label.font.withSize(11)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    lazy var productValue: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var productName: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var colorName: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.text = "Cor: Branca"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var buttonCollor: ColorsView = {
        let button = ColorsView(colors: color)
        button.onColorSelect = { color in
            
        }
        button.isUserInteractionEnabled = true
//        button.addGestureRecognizer(((UITapGestureRecognizer(target: self, action: #selector(didTapView)))))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonSelectSize: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.text = "Selecione um tamanho"
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
    
    init(productId: String) {
        self.productId = productId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupViewModel()
    }
    
    private func setupViewModel() {
        viewModel?.onProductFetched = {
            guard let product = self.viewModel?.product else { return }
            self.updateUI(with: product)
        }
        
        viewModel?.onProductFetchError = {
            
        }
    }
    
    private func updateUI(with product: Product) {
        productName.text = product.name
        productValue.text = product.price
        productDetails.text = product.detail
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.fetchProductDetails(id: productId)
    }
    
    // MARK: - Actions
    
    @objc func didTapView() {
        print("did tap view")
    }
}

//MARK

extension ViewController: ViewCode{
    
    func buildViewHierarchy() {
        view.addSubview(imageView)
        view.addSubview(installmentValue)
        view.addSubview(productValue)
        view.addSubview(productName)
        view.addSubview(colorName)
        view.addSubview(buttonCollor)
        view.addSubview(buttonSelectSize)
        view.addSubview(button1Size)
        view.addSubview(button2Size)
        view.addSubview(productDetails)
        view.addSubview(buttonBuyNow)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),
      //      imageView.bottomAnchor.constraint(equalTo: productValue.topAnchor, constant: 32),
            
        //    buttonBag.topAnchor.constraint(equalTo: topAnchor, constant: 35),
        //    buttonBag.leftAnchor.constraint(equalTo: leftAnchor, constant: 343),
        //    buttonBag.heightAnchor.constraint(equalToConstant: 40),
         //   buttonBag.widthAnchor.constraint(equalToConstant: 40),
            
            productValue.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 291),
            productValue.bottomAnchor.constraint(equalTo: colorName.topAnchor, constant: -40),
            
            productName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            productName.bottomAnchor.constraint(equalTo: colorName.topAnchor, constant: -40),
            
            installmentValue.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 298),
            installmentValue.topAnchor.constraint(equalTo: productValue.bottomAnchor, constant: 4),
            installmentValue.centerXAnchor.constraint(equalTo: productValue.centerXAnchor, constant: 4),
            
            colorName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorName.bottomAnchor.constraint(equalTo: buttonCollor.topAnchor, constant: -24),
            
            buttonCollor.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonCollor.bottomAnchor.constraint(equalTo: buttonSelectSize.topAnchor, constant: -32),
            buttonCollor.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            
            buttonSelectSize.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonSelectSize.bottomAnchor.constraint(equalTo: button1Size.topAnchor, constant: -24),
            
            button1Size.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button2Size.centerXAnchor.constraint(equalTo: button1Size.centerXAnchor),
            button2Size.topAnchor.constraint(equalTo: button1Size.bottomAnchor),
            
            productDetails.topAnchor.constraint(equalTo: button2Size.bottomAnchor, constant: 47),
            productDetails.bottomAnchor.constraint(equalTo: buttonBuyNow.topAnchor, constant: -47),
            productDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
            buttonBuyNow.topAnchor.constraint(equalTo: productDetails.bottomAnchor, constant: 47),
            buttonBuyNow.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 67),
            buttonBuyNow.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -67),
            buttonBuyNow.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -123),
            buttonBuyNow.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .black
    }
}
