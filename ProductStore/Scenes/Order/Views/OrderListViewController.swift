//
//  OrderListViewController.swift
//  ProductStore
//
//  Created by Luan.Lima on 26/03/22.
//

import UIKit

class OrderListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView()
  
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.white
        setupTableView()
        self.title = "Pedidos"
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        tableView.register(OrderListViewCell.self, forCellReuseIdentifier: OrderListViewCell.identifier)
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderListViewCell.identifier, for: indexPath) as! OrderListViewCell
        cell.imageTshirts.image = UIImage(named: "camisetaDev")
        cell.orderStatus.text = "Entregue"
        cell.statusDescription.text = "Chegou dia 14 de setembro."
        
        return cell    
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

}
