//
//  ListingProductViewController.swift
//  ProductStore
//
//  Created by Luan.Lima on 16/03/22.
//

import UIKit

class ListingProductViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
     
    var collectionView: UICollectionView!
    
    var cel = ListingCollectionViewCell()
    
    @objc lazy var buttonBag: UIButton = {
        let image = UIButton()
        image.isUserInteractionEnabled = true
//        image.addGestureRecognizer((UITapGestureRecognizer(target: self, action: #selector(didTapView))))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 13
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (view.frame.size.width/2)-8, height: (view.frame.size.height/3)-7)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.register(HeaderListingCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderListingCollectionViewCell.headIdentifier)
        
        layout.headerReferenceSize = CGSize(width: self.collectionView.frame.size.width, height: 125)
        
        collectionView.register(ListingCollectionViewCell.self, forCellWithReuseIdentifier: ListingCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        
        
        let bag = UIBarButtonItem(image: UIImage(systemName: "bag"), style: .plain, target: self, action:  #selector(getter: buttonBag))
        self.navigationItem.rightBarButtonItem = bag
        
        self.title = "BeaglleStore"
        
       
//        cel.buttonAdd.addTarget(self, action: #selector(addProduct), for: .touchUpInside)
        
        
    }
 
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.navigationController?.pushViewController(ProductDetailViewController(productId: "asd"), animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderListingCollectionViewCell.headIdentifier, for: indexPath)

            headerView.frame.size.height = 110
        
        

            return headerView
        
       
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: ListingCollectionViewCell.identifier, for: indexPath) as! ListingCollectionViewCell
        
        
        celula.imageView.image = UIImage(named: "camiseta")
        celula.priceLabel.text = "R$ 59.90"
        
        return celula
        
    }
    
}




