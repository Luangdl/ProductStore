//
//  CustomCollectionViewCell.swift
//  ProductStore
//
//  Created by Luan.Lima on 12/03/22.


import UIKit

class ListingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ListingCollectionViewCell"
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "padrao")
        imageView.clipsToBounds = true
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(11)
        label.text = "T-Shirt Git hub"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
        lazy var priceLabel: UILabel = {
            let label = UILabel(frame: .zero)
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.text = "R$ 60,00"
            label.textAlignment = .center
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
    
            return label
        }()
    
        lazy var installmentLabel: UILabel = {
            let label = UILabel(frame: .zero)
            label.font = label.font.withSize(11)
            label.text = "3x de 20,00"
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
    
            return label
        }()
    
        lazy var buttonAdd: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemGreen
            button.setTitle("Adicionar", for: .normal)
            button.layer.cornerRadius = 19
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button
        }()
        
    override init(frame: CGRect) {
            super.init(frame: frame)
        
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 16
        contentView.clipsToBounds = true
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(installmentLabel)
        contentView.addSubview(buttonAdd)
        contentView.clipsToBounds = true
        setupConstraint()
        }
    
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    func set(_ listing: ListItem) {
        nameLabel.text = listing.name
        priceLabel.text = listing.price
        installmentLabel.text = listing.installment
    }

    func setupConstraint() {
        
        imageView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, heightConstant: 180)
    
        nameLabel.anchor(top: imageView.bottomAnchor, topConstant: 8.54)
        nameLabel.anchorCenterXToSuperview()
        
        priceLabel.anchor(top: nameLabel.bottomAnchor, topConstant: 10)
        priceLabel.anchorCenterXToSuperview()
        
        installmentLabel.anchor(top: priceLabel.bottomAnchor, bottomConstant: 3)
        installmentLabel.anchorCenterXToSuperview()

        buttonAdd.anchor(top: installmentLabel.bottomAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, topConstant: 16, bottomConstant: 7 )
        buttonAdd.anchorCenterXToSuperview()
        buttonAdd.anchor(heightConstant: 35)
        buttonAdd.anchor(widthConstant: 120)
    }
}




