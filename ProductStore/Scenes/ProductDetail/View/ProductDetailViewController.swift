//
//  ViewController.swift
//  ProductStore
//
//  Created by Luan Gomes on 31/01/22.
//

import UIKit


class ProductDetailViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: Properties
    
    lazy var image = UIImage(systemName: "bag")
    
    var color: [UIColor] = [.white, .blue, .green, .yellow]
    
    var sizes1: [String] = ["PP","P","M"]
    var sizes2: [String] = ["G","GG","XG"]
    
    let productId: String
    
    var viewModel: ProductDetailViewModelProtocol = ProductDetailViewModel()
    
    //MARK: UI
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.delegate = self
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isDirectionalLockEnabled = true
        
        return scrollView
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "camiseta")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
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
            self.viewModel.changeColorTo(color)
        }
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(((UITapGestureRecognizer(target: self, action: #selector(didTapView)))))
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
        button1.onSizeSelect = { size in
            self.viewModel.changeSize1To(size)
        }
        button1.isUserInteractionEnabled = true
        button1.addGestureRecognizer(((UITapGestureRecognizer(target: self, action: #selector(didTapView)))))
        button1.translatesAutoresizingMaskIntoConstraints = false
        return button1
    }()
    
    lazy var button2Size: SizesView = {
        let button2 = SizesView(sizes: sizes2)
        button2.onSizeSelect = { size in
            self.viewModel.changeSize1To(size)
        }
        button2.isUserInteractionEnabled = true
        button2.addGestureRecognizer(((UITapGestureRecognizer(target: self, action: #selector(didTapView)))))
        button2.translatesAutoresizingMaskIntoConstraints = false
        return button2
    }()
    
    private lazy var sizeButtonVStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [button1Size, button2Size])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    
    lazy var productDetails: UILabel = {
        let label = UILabel(frame: .zero)
        label.isUserInteractionEnabled = true
        label.textColor = .white
        label.text = ("Detalhes do produto")
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var buttonBuyNow: UIButton = {
        let button = UIButton(frame: .zero)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(((UITapGestureRecognizer(target: self, action: #selector(didTapView)))))
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 25
        button.setTitle("Comprar agora", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    //MARK: Init
    
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
    
    override func viewDidAppear(_ animated: Bool) {
       scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+49)
    }
    
    private func setupViewModel() {
        viewModel.onProductFetched = {
            guard let product = self.viewModel.product else { return }
            self.updateUI(with: product)
        }
        
        viewModel.onProductFetchError = {
            
        }
    }
    
    private func updateUI(with product: Product) {
        productName.text = product.name
        productValue.text = product.price
        productDetails.text = product.detail
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchProductDetails(id: productId)
    }
    
    // MARK: - Actions
    
    @objc func didTapView() {
        print("did tap view")
    }

    
}

//MARK

extension ProductDetailViewController: ViewCode{
    
    func buildViewHierarchy() {


        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(productName)
        containerView.addSubview(productValue)
        containerView.addSubview(colorName)
//        containerView.addSubview(installmentValue)
        containerView.addSubview(buttonCollor)
        containerView.addSubview(buttonSelectSize)
        containerView.addSubview(sizeButtonVStack)
        containerView.addSubview(productDetails)
        containerView.addSubview(buttonBuyNow)
        
    }
    
    func setupConstraints() {
        
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, bottomConstant: -49)
        
        containerView.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: scrollView.bottomAnchor, right: view.rightAnchor)
        
        imageView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, right: containerView.rightAnchor, heightConstant: 300)
    
        productName.anchor(top: imageView.bottomAnchor, left: containerView.leftAnchor, topConstant: 33, leftConstant: 16)
        
        productValue.anchor(top: imageView.bottomAnchor, right: containerView.rightAnchor, topConstant: 33, rightConstant: 16)
        
        NSLayoutConstraint.activate([
           
       //     scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
       //     scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -49),
        //    scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
        //    scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
      //      containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
     //       containerView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
     //       containerView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
     //       containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
    //        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
          
   //         imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
   //         imageView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
    //        imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
    //        imageView.heightAnchor.constraint(equalToConstant: 300),
            
   //         productName.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 33),
  //          productName.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16),
            
 //           productValue.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 33),
  //          productValue.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16),
            
            colorName.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 16),
            colorName.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            buttonCollor.topAnchor.constraint(equalTo: colorName.bottomAnchor, constant: 16),
            buttonCollor.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            buttonSelectSize.topAnchor.constraint(equalTo: buttonCollor.bottomAnchor, constant: 16),
            buttonSelectSize.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            sizeButtonVStack.topAnchor.constraint(equalTo: buttonSelectSize.bottomAnchor, constant: 16),
            sizeButtonVStack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            productDetails.topAnchor.constraint(equalTo: sizeButtonVStack.bottomAnchor, constant: 16),
            productDetails.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16),
            
            buttonBuyNow.topAnchor.constraint(equalTo: productDetails.bottomAnchor, constant: 16),
            buttonBuyNow.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            buttonBuyNow.heightAnchor.constraint(equalToConstant: 50),
            buttonBuyNow.widthAnchor.constraint(equalToConstant: 180)
            
        ])
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .black
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.bounces = (scrollView.contentOffset.y > 100)
    }
    
    
}
