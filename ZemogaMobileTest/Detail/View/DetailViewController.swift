//
//  DetailViewController.swift
//  ZemogaMobileTest
//
//  Created by Kevinho Morales on 26/6/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var labelTest: UILabel!
    
    lazy var viewModel: DetailViewModel = {
        DetailViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "COMMENTS"
        viewModel.viewDidLoad(label: labelTest)
    }

}
