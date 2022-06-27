//
//  DetailViewController.swift
//  ZemogaMobileTest
//
//  Created by Kevinho Morales on 26/6/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    lazy var viewModel: DetailViewModel = {
        DetailViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "POST"
        viewModel.tableView = tableView
        viewModel.viewDidLoad(label: descriptionLabel)
    }

}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentsTableViewCell.CELL_ID, for: indexPath) as! CommentsTableViewCell
        let comment = viewModel.comments?[indexPath.row]
        cell.setUpCell(comment: comment!)
        return cell
    }
}
