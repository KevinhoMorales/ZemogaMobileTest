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
    var viewcontroller: UIViewController?
    
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
        setUpBarButtons()
    }
    
    internal func setUpBarButtons() {
        let profileBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .done, target: self, action: #selector(profileAction))
        let refreshBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .done, target: self, action: #selector(refreshAction))
        viewcontroller?.navigationItem.leftBarButtonItem  = profileBarButtonItem
        viewcontroller?.navigationItem.rightBarButtonItem  = refreshBarButtonItem
    }
    
    @objc
    fileprivate func profileAction() {
        print("clicked")
    }
    
    @objc
    fileprivate func refreshAction() {
        getPosts { [weak self] posts in
            self?.posts = posts
            DispatchQueue.main.async {
                self?.tableView!.reloadData()
            }
        }
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
