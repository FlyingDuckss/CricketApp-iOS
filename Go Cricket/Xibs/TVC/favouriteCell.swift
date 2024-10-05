//
//  favouriteCell.swift
//  Go Cricket
//
//  Created by Usama on 03/10/2024.
//

import UIKit

class favouriteCell: UITableViewCell {

    @IBOutlet weak var teamDescLbl: UILabel!
    @IBOutlet weak var teamNameLbl: UILabel!
    @IBOutlet weak var tvcImageImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
