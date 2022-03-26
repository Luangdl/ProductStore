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
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "camiseta")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    @objc lazy var buttonBag: UIButton = {
        let image = UIButton()
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
//        button.addGestureRecognizer(((UITapGestureRecognizer(target: self, action: #selector(buyNow)))))
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
        
        buttonBuyNow.isUserInteractionEnabled = true
        buttonBuyNow.addTarget(self, action: #selector(didTapView), for: .touchUpInside)
        
        let bag = UIBarButtonItem(image: UIImage(systemName: "bag"), style: .plain, target: self, action:  #selector(getter: buttonBag))
        self.navigationItem.rightBarButtonItem = bag
        
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(getter: buttonBag))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Bag", style: .plain, target: self, action: #selector(getter: buttonBag))
        
        
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
    

    
//    @objc func buyNow() {
//
//        self.navigationController?.pushViewController(ListingProductViewController(), animated: true)
//}


}



//MARK

extension ProductDetailViewController: ViewCode{
    
    func buildViewHierarchy() {


        view.addSubview(scrollView)
   
//        scrollView.addSubview(buttonBag)
        scrollView.addSubview(imageView)
        scrollView.addSubview(productName)
        scrollView.addSubview(productValue)
        scrollView.addSubview(colorName)
        //        containerView.addSubview(installmentValue)
        scrollView.addSubview(buttonCollor)
        scrollView.addSubview(buttonSelectSize)
        scrollView.addSubview(sizeButtonVStack)
        scrollView.addSubview(productDetails)
        scrollView.addSubview(buttonBuyNow)
        

    }
    
    func setupConstraints() {
        
//        buttonBag.anchor(top: navigationController?.navigationBar.topAnchor, left: navigationController?.navigationBar.leftAnchor, bottom: scrollView.bottomAnchor, leftConstant: 200)
        
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, bottomConstant: -49)
        
//        containerView.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: scrollView.bottomAnchor, right: view.rightAnchor)
//
        imageView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, right: view.rightAnchor, heightConstant: 300)
    
        productName.anchor(top: imageView.bottomAnchor, left: scrollView.leftAnchor, topConstant: 33, leftConstant: 16)
        
        productValue.anchor(top: imageView.bottomAnchor, right: scrollView.rightAnchor, topConstant: 33, rightConstant: -400)
        
        colorName.anchorCenterXToSuperview()
        colorName.anchor(top: productName.bottomAnchor, bottomConstant: 16)
        
        buttonCollor.anchor(top: colorName.bottomAnchor, topConstant: 16)
        buttonCollor.anchorCenterXToSuperview()
        
        buttonSelectSize.anchor(top: buttonCollor.bottomAnchor, topConstant: 16)
        buttonSelectSize.anchorCenterXToSuperview()
        
        sizeButtonVStack.anchor(top: buttonSelectSize.bottomAnchor, topConstant: 16)
        sizeButtonVStack.anchorCenterXToSuperview()
        
        productDetails.anchor(top: sizeButtonVStack.bottomAnchor, topConstant: 16)
        productDetails.anchor(left: scrollView.leftAnchor, leftConstant: 16)
        
        buttonBuyNow.anchor(top: productDetails.bottomAnchor, topConstant: 16)
        buttonBuyNow.anchorCenterXToSuperview()
        buttonBuyNow.anchor(heightConstant: 50)
        buttonBuyNow.anchor(widthConstant: 180)
        
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .black
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.bounces = (scrollView.contentOffset.y > 100)
    }
    
    
}
