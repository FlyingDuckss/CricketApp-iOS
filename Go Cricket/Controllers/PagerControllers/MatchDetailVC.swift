//
//  MatchDetailVC.swift
//  Go Cricket
//
//  Created by Usama on 06/10/2024.
//

import UIKit

class MatchDetailVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var topParentView: UIView!
    @IBOutlet weak var teamScoreOne: UILabel!
    @IBOutlet weak var teamNameOne: UILabel!
    @IBOutlet weak var teamImageOne: UIImageView!
    @IBOutlet weak var matchTitile: UILabel!
    @IBOutlet weak var teamNameTwo: UILabel!
    @IBOutlet weak var teamScoreTwo: UILabel!
    @IBOutlet weak var teamImageTwo: UIImageView!
    @IBOutlet weak var closeBtn: UIButton!
    
    
    @IBOutlet weak var bottomParentView: UIView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var venueLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var matchTypeLbl: UILabel!
    
    
    @IBOutlet weak var matchSummaryView: UIView!
    
    
    var data: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topParentView.layer.cornerRadius = 10
        bottomParentView.layer.cornerRadius = 10
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        initTopViewData()
        initBottomViewData()
    }
    
    func initTopViewData() {
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
    
    func initBottomViewData() {
        self.matchTypeLbl.text = self.data?.matchType
        self.statusLbl.text = data?.status
        self.venueLbl.text = data?.venue
        self.dateLbl.text = data?.date
    }
    
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension MatchDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MATCH_DETAIL.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MatchDetailCVC", for: indexPath) as! MatchDetailCVC
        cell.detailLbl.text = MATCH_DETAIL[indexPath.row]
        cell.backgroundColor = .clear
        cell.detailLbl.textColor = .white
        if indexPath.row == 0 {
            cell.detailLbl.font = UIFont.boldSystemFont(ofSize:  cell.detailLbl.font.pointSize)

        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MatchDetailCVC
        cell.detailLbl.textColor = UIColor(hexString: "FFDA3A")
        cell.detailLbl.font = UIFont.boldSystemFont(ofSize:  cell.detailLbl.font.pointSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MatchDetailCVC
        cell.detailLbl.textColor = UIColor.white
        cell.detailLbl.font = UIFont.systemFont(ofSize:  cell.detailLbl.font.pointSize)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/3) - 10, height: collectionView.frame.height)
    }
}
