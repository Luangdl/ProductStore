//
//  CustomCollectionViewCell.swift
//  ProductStore
//
//  Created by Luan.Lima on 06/02/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    static let identifier = "CustomCollectionViewCell"
    
/*    lazy var imagesView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "house")
        return imageView
        
    }()*/
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    //    contentView.addSubview(imagesView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
     //   imagesView.frame = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
    }
}
