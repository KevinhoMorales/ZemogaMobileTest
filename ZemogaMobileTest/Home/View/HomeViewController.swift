//
//  HomeViewController.swift
//  ZemogaMobileTest
//
//  Created by Kevinho Morales on 26/6/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel: HomeViewModel = {
        HomeViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "POSTS"
        viewModel.viewDidLoad(tableView: tableView)
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let post = viewModel.posts?[indexPath.row]
        cell.textLabel?.text = post?.title
        cell.detailTextLabel?.text = post?.body
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = viewModel.posts?[indexPath.row]
        viewModel.didSelectedPost(post: post!)
    }

}
