//
//  MainCoordinator.swift
//  ZemogaMobileTest
//
//  Created by Kevinho Morales on 26/6/22.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController {get set}
    func welcomeView()
}

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController = UINavigationController()
    
    func welcomeView() {
        let welcomeView = HomeViewController(nibName: "HomeViewController", bundle: nil)
        welcomeView.viewModel.coordinator = self
        navigationController.pushViewController(welcomeView, animated: true)
    }
    
    func detailView(commentId: CommentId) {
        let detailView = DetailViewController(nibName: "DetailViewController", bundle: nil)
        detailView.viewModel.coordinator = self
        detailView.viewModel.commentId = commentId
        navigationController.pushViewController(detailView, animated: true)
    }
}
