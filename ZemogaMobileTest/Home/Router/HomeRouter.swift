//
//  HomeRouter.swift
//  ZemogaMobileTest
//
//  Created by Kevinho Morales on 26/6/22.
//

import Foundation
import UIKit

protocol HomeRouter {
    var coordinator: MainCoordinator? {get set}
    var posts: [Posts]? {get set}
    func viewDidLoad(tableView: UITableView)
    func setUpView()
    func getPosts(completion: @escaping ([Posts]) -> ())
    func didSelectedPost(post: Posts)
}
