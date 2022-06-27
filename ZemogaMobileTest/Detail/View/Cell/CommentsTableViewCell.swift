//
//  CommentsTableViewCell.swift
//  ZemogaMobileTest
//
//  Created by Kevinho Morales on 27/6/22.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {

    @IBOutlet weak var bodyCommentLabel: UILabel!
    
    static let CELL_ID = "COMMENNT_CELL_ID"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal func setUpCell(comment: Comments) {
        bodyCommentLabel.text = comment.body
    }
    
}
