//
//  HomeViewModel.swift
//  ZemogaMobileTest
//
//  Created by Kevinho Morales on 26/6/22.
//

import UIKit

final class HomeViewModel: HomeRouter {
    var posts: [Posts]?
    var coordinator: MainCoordinator?
    var tableView: UITableView?
    
    func viewDidLoad() {
        setUpView()
        getPosts { [weak self] posts in
            self?.posts = posts
            DispatchQueue.main.async {
                self?.tableView!.reloadData()
            }
        }
    }
    
    func setUpView() {
        posts = [Posts]()
        setUpCell()
    }
    
    func getPosts(completion: @escaping ([Posts]) -> ()) {
        NetworkingManager.shared.getPosts(completion: completion)
    }
    
    func didSelectedPost(post: Posts) {
        NetworkingManager.shared.getCommentId(post: post) { [weak self] comments in
            DispatchQueue.main.async {
                self?.coordinator?.detailView(comments: comments)
            }
        }
    }
    
    func deleteAll() {
        posts?.removeAll()
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    
    func setUpCell() {
        let cell = UINib(nibName: "HomeTableViewCell", bundle: nil)
        tableView?.register(cell, forCellReuseIdentifier: HomeTableViewCell.CELL_ID)
        tableView?.tableFooterView = UIView()
    }
}
