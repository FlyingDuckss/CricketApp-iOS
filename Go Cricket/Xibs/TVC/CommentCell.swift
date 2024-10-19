//
//  CommentCell.swift
//  Go Cricket
//
//  Created by Osama on 2024/10/19.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var userImageLbl: UIImageView!
    @IBOutlet weak var commentLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var parentView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    func initCellData(userName: String, comment: String) {
        self.commentLbl.text = comment
        self.usernameLbl.text = userName
        self.parentView.layer.cornerRadius = 10
        self.userImageLbl.image = UIImage(named: "user_icon")
        self.userImageLbl.layer.cornerRadius = self.userImageLbl.frame.width/2
        
    }
}
