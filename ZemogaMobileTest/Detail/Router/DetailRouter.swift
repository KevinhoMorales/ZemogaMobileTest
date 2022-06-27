//
//  DetailRouter.swift
//  ZemogaMobileTest
//
//  Created by Kevinho Morales on 26/6/22.
//

import UIKit

protocol DetailRouter {
    var coordinator: MainCoordinator? {get set}
    var comments: [Comments]? {get}
    var tableView: UITableView? {get set}
    func viewDidLoad(label: UILabel)
    func setUpView()
    func setUpCell()
}
