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
    var tableView: UITableView? {get set}
    func viewDidLoad()
    func setUpView()
    func getPosts(completion: @escaping ([Posts]) -> ())
    func didSelectedPost(post: Posts)
    func setUpCell()
    func deleteAll()
}
