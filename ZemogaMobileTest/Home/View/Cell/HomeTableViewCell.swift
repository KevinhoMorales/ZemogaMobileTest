//
//  HomeTableViewCell.swift
//  ZemogaMobileTest
//
//  Created by Kevinho Morales on 26/6/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var bodyLabel: UILabel!
    
    static var CELL_ID = "POST_CELL_ID"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal func setUpCell(post: Posts) {
        bodyLabel.text = post.body
    }
}
