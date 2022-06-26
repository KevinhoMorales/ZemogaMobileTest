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
    
    func viewDidLoad(tableView: UITableView) {
        setUpView()
        getPosts { [weak self] posts in
            self?.posts = posts
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }
    
    func setUpView() {
        posts = [Posts]()
    }
    
    func getPosts(completion: @escaping ([Posts]) -> ()) {
        NetworkingManager.shared.getPosts(completion: completion)
    }
    
    func didSelectedPost(post: Posts) {
        NetworkingManager.shared.getCommentId(post: post) { [weak self] commentId in
            DispatchQueue.main.async {
                self?.coordinator?.detailView(commentId: commentId)
            }
        }
    }
    
}
