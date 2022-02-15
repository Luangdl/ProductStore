//
//  ViewController.swift
//  ProductStore
//
//  Created by Luan Gomes on 31/01/22.
//

import UIKit

class ViewController: UIViewController {
    
     private var tappableView: UIView! {
        didSet{
            tappableView.backgroundColor = .red
        }
    }
    
    var screenProductDetails = ScreenProductDetails()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = screenProductDetails
        

    
}


}
