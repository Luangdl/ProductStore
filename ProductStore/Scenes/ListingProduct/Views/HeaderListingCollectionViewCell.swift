//
//  HeaderListingCollectionViewCell.swift
//  ProductStore
//
//  Created by Luan.Lima on 25/03/22.
//

import UIKit

class HeaderListingCollectionViewCell: UICollectionViewCell {
    
    static let headIdentifier = "headerView"
    
    lazy var imageTshirts: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "camisetaDev")
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var imageMug: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "caneca")
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var imageStickers: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "stickers")
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var nameTshirts: UILabel = {
        let label = UILabel()
        label.text = "T-Shirts"
        label.textColor = .white
        label.font = label.font.withSize(11)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var nameMug: UILabel = {
        let label = UILabel()
        label.text = "Canecas"
        label.textColor = .white
        label.font = label.font.withSize(11)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var nameStickers: UILabel = {
        let label = UILabel()
        label.text = "Stickers"
        label.textColor = .white
        label.font = label.font.withSize(11)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 2
        contentView.clipsToBounds = true
        
        contentView.addSubview(imageTshirts)
        contentView.addSubview(imageMug)
        contentView.addSubview(imageStickers)
        contentView.addSubview(nameTshirts)
        contentView.addSubview(nameMug)
        contentView.addSubview(nameStickers)
        
        setupConstraint()
        
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraint() {
        
        imageTshirts.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, topConstant: 10, leftConstant: 25, bottomConstant: 20)
        imageTshirts.anchor(heightConstant: 50)
        imageTshirts.anchor(widthConstant: 50)
        
        nameTshirts.anchor(top: imageTshirts.bottomAnchor, left: leftAnchor, topConstant: 2, leftConstant: 25)
        
        imageMug.anchor(top: topAnchor, left: imageTshirts.leftAnchor, bottom: bottomAnchor, topConstant: 10, leftConstant: 140, bottomConstant: 20)
        imageMug.anchor(heightConstant: 50)
        imageMug.anchor(widthConstant: 50)
        
        nameMug.anchor(top: imageMug.bottomAnchor, left: imageTshirts.leftAnchor, topConstant: 2, leftConstant: 140)
        
        imageStickers.anchor(top: topAnchor, left: nameMug.leftAnchor, bottom: bottomAnchor, topConstant: 10, leftConstant: 140, bottomConstant: 20)
        imageStickers.anchor(heightConstant: 50)
        imageStickers.anchor(widthConstant: 50)
        
        nameStickers.anchor(top: imageStickers.bottomAnchor, left: nameMug.leftAnchor, topConstant: 2, leftConstant: 140)
        
        
    }
    
    
    
    
}
