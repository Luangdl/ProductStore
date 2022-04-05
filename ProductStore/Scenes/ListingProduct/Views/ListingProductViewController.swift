//
//  ListingProductViewController.swift
//  ProductStore
//
//  Created by Luan.Lima on 16/03/22.
//

import UIKit

class ListingProductViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
     
    // MARK: Properties
    
    var collectionView: UICollectionView!
    
    var viewModel: ListViewModelProtocol = ListViewModel()
    
    //MARK: UI
    
    @objc lazy var buttonBag: UIButton = {
        let image = UIButton()
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 13
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (view.frame.size.width/2)-8, height: CGFloat(326))

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
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewModel() {
        viewModel.onListingFound = {
            self.collectionView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getListProduct()
    }
    
    // MARK: - Navigation
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(ProductDetailViewController(productId: "asd"), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderListingCollectionViewCell.headIdentifier, for: indexPath)

            headerView.frame.size.height = 110
            return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.itemList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListingCollectionViewCell.identifier, for: indexPath) as! ListingCollectionViewCell

        guard let itemList = viewModel.itemList?[indexPath.row] else { return cell }
        cell.set(itemList)
        
        return cell
    }
}




