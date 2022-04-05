//
//  OrderListViewCell.swift
//  ProductStore
//
//  Created by Luan.Lima on 26/03/22.
//

import UIKit

class OrderListViewCell: UITableViewCell {
    
   static let identifier = "OrderListViewCell"

    lazy var imageTshirts: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "camisetaDev")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var orderStatus: UILabel = {
        let label = UILabel()
        label.text = "Entregue"
        label.textColor = .green
        label.font = label.font.withSize(14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var statusDescription: UILabel = {
        let label = UILabel()
        label.text = "Status"
        label.textColor = .white
        label.font = label.font.withSize(14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(imageTshirts)
        contentView.addSubview(orderStatus)
        contentView.addSubview(statusDescription)
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraint() {
        
        imageTshirts.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, topConstant: 13, leftConstant: 20, bottomConstant: 13, widthConstant: 80, heightConstant: 91)
        orderStatus.anchor(top: topAnchor, left: imageTshirts.rightAnchor, bottom: bottomAnchor, topConstant: 13, leftConstant: 17, bottomConstant: 95)
        statusDescription.anchor(top: orderStatus.bottomAnchor, left: imageTshirts.rightAnchor, bottom: bottomAnchor, topConstant: 6, leftConstant: 17, bottomConstant: 70)
    }
 
}


