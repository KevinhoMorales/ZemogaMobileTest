//
//  DetailRouter.swift
//  ZemogaMobileTest
//
//  Created by Kevinho Morales on 26/6/22.
//

import UIKit

protocol DetailRouter {
    var coordinator: MainCoordinator? {get set}
    var commentId: CommentId? {get}
    func viewDidLoad(label: UILabel)
    func setUpView()
}
