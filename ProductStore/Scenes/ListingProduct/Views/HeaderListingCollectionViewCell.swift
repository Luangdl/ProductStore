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
        image.layer.cornerRadius = 37.5
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var imageMug: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "caneca")
        image.clipsToBounds = true
        image.layer.cornerRadius = 37.5
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var imageStickers: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "stickers")
        image.clipsToBounds = true
        image.layer.cornerRadius = 37.5
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
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            imageTshirts.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageTshirts.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            imageTshirts.heightAnchor.constraint(equalToConstant: 75),
            imageTshirts.widthAnchor.constraint(equalToConstant: 75),
            
            nameTshirts.centerXAnchor.constraint(equalTo: imageTshirts.centerXAnchor),
            nameTshirts.topAnchor.constraint(equalTo: imageMug.bottomAnchor, constant: 7),
            
            imageMug.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageMug.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageMug.heightAnchor.constraint(equalToConstant: 75),
            imageMug.widthAnchor.constraint(equalToConstant: 75),
        
            nameMug.centerXAnchor.constraint(equalTo: imageMug.centerXAnchor),
            nameMug.topAnchor.constraint(equalTo: imageMug.bottomAnchor, constant: 7),
        
            imageStickers.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageStickers.rightAnchor.constraint(equalTo: rightAnchor, constant: -25),
            imageStickers.heightAnchor.constraint(equalToConstant: 75),
            imageStickers.widthAnchor.constraint(equalToConstant: 75),
            
            nameStickers.centerXAnchor.constraint(equalTo: imageStickers.centerXAnchor),
            nameStickers.topAnchor.constraint(equalTo: imageStickers.bottomAnchor, constant: 7),
        ])
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
}
