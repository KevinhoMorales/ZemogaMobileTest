//
//  DetailViewModel.swift
//  ZemogaMobileTest
//
//  Created by Kevinho Morales on 26/6/22.
//

import UIKit

final class DetailViewModel: DetailRouter {
    var coordinator: MainCoordinator?
        
    var commentId: CommentId?
    
    func viewDidLoad(label: UILabel) {
        setUpView()
        label.text = commentId?.email
    }
    
    func setUpView() {
        
    }
}
