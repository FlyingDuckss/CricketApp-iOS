//
//  LeagueCell.swift
//  Go Cricket
//
//  Created by Usama on 05/10/2024.
//

import UIKit

class LeagueCell: UITableViewCell {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var teamImageTwo: UIImageView!
    @IBOutlet weak var teamScoreTwo: UILabel!
    @IBOutlet weak var teamNameTwo: UILabel!
    @IBOutlet weak var matchTitile: UILabel!
    
    @IBOutlet weak var teamImageOne: UIImageView!
    @IBOutlet weak var teamNameOne: UILabel!
    @IBOutlet weak var teamScoreOne: UILabel!
    
    var data: Data?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initData(data: Data) {
        parentView.layer.borderWidth = 2
        parentView.layer.borderColor = UIColor(hexString: "676767")?.cgColor
        parentView.layer.cornerRadius = 10
        contentView.backgroundColor = .black
        
        self.data = data
        self.teamImageOne.layer.cornerRadius = 10
        self.teamImageTwo.layer.cornerRadius = 10
        
        self.matchTitile.text = self.data?.name
        
        self.teamNameOne.text = self.data?.teams?[0]
        self.teamNameTwo.text = self.data?.teams?[1]
        
        if self.data?.score?.count == 1 {
            self.teamScoreOne.text  = "\(self.data?.score?[0].r ?? 0)-\(self.data?.score?[0].o ?? 0)"
        } else {
            self.teamScoreOne.text = "0-0"
        }
        
        if self.data?.score?.count == 2 {
            self.teamScoreTwo.text = "\(self.data?.score?[1].r ?? 0)-\(self.data?.score?[1].o ?? 0)"
        } else {
            self.teamScoreTwo.text = "0-0"
        }
        
        self.teamImageOne.sd_setImage(with: URL(string: (self.data?.teamInfo?[0].img)!))
        
        
        if self.data?.teamInfo?.count == 2 {
            self.teamImageTwo.sd_setImage(with: URL(string: (self.data?.teamInfo?[1].img) ?? ""))
        }
    }

}
