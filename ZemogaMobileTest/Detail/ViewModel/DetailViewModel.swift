//
//  DetailViewModel.swift
//  ZemogaMobileTest
//
//  Created by Kevinho Morales on 26/6/22.
//

import UIKit

final class DetailViewModel: DetailRouter {
    var coordinator: MainCoordinator?
    var tableView: UITableView?
        
    var comments: [Comments]?
    
    func viewDidLoad(label: UILabel) {
        setUpView()
        label.text = comments?.first?.email
    }
    
    func setUpView() {
        setUpCell()
    }
    
    func setUpCell() {
        let cell = UINib(nibName: "CommentsTableViewCell", bundle: nil)
        tableView?.register(cell, forCellReuseIdentifier: CommentsTableViewCell.CELL_ID)
        tableView?.tableFooterView = UIView()
    }
}
