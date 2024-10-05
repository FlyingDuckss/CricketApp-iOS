//
//  NewsCell.swift
//  Go Cricket
//
//  Created by Usama on 06/10/2024.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var newsSubTitle: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initData(model: News) {
        self.newsImageView.sd_setImage(with: URL(string: model.imageURL!))
        self.newsTitle.text = model.headline
        self.newsSubTitle.text = model.subheading
    }

}
