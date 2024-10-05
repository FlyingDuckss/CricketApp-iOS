//
//  ExploreCVC.swift
//  Go Cricket
//
//  Created by Usama on 04/10/2024.
//

import UIKit
import SDWebImage

class ExploreCVC: UICollectionViewCell {

    @IBOutlet weak var collectionImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initCell(data: ExploreModel) {
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor(hexString: "676767")!.cgColor
        self.layer.borderWidth = 2
        self.titleLbl.text = data.title
        self.collectionImageView.sd_setImage(with: URL(string: data.imageURL!))
    }

}
