//
//  MatchDetailVC.swift
//  Go Cricket
//
//  Created by Usama on 06/10/2024.
//

import UIKit
import FirebaseDatabaseInternal

class MatchDetailVC: UIViewController {

    var comments: [Comment] = []
    let database = Database.database().reference()
    
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
    
    //MARK: Comment View outlets
    @IBOutlet weak var commentContainerView: UIView!
    @IBOutlet weak var matchCommentView: UIView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var commentsTableView: UITableView!
    @IBOutlet weak var commentSendBtn: UIButton!
    
    
    @IBOutlet weak var matchSummaryView: UIView!
    
    
    var data: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topParentView.layer.cornerRadius = 10
        bottomParentView.layer.cornerRadius = 10
        
        collectionView.delegate = self
        collectionView.dataSource = self
        commentsTableView.dataSource = self
        commentsTableView.delegate = self
        
        initTopViewData()
        initBottomViewData()
        initCommentView()
        
        matchCommentView.isHidden = true
        
        fetchComments { _ in
            DispatchQueue.main.async(execute: {
                self.commentsTableView.reloadData()
            })
        }
    }
    
    func scrollToBottom() {
        DispatchQueue.main.async(execute: {
            guard self.comments.count > 0 else { return }
            let lastRowIndex = self.comments.count - 1
            let indexPath = IndexPath(row: lastRowIndex, section: 0)
            self.commentsTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        })
        }
    
    func initCommentView() {
        commentContainerView.layer.shadowOpacity = 0.7
        commentContainerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        commentContainerView.layer.shadowRadius = 15.0
        commentContainerView.layer.shadowColor = UIColor(hexString: "FFDA3A")?.cgColor
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
    
    func navigateToScreen(index: Int) {
        switch index {
        case 0:
            matchSummaryView.isHidden = false
            matchCommentView.isHidden = true
            break
        case 1:
            matchSummaryView.isHidden = true
            matchCommentView.isHidden = true
            break
        case 2:
            matchSummaryView.isHidden = true
            matchCommentView.isHidden = true
            break
        case 3:
            matchSummaryView.isHidden = true
            matchCommentView.isHidden = false
            break
        default:
            break
        }
    }
    
    @IBAction func sendCommentBtnClicked(_ sender: Any) {
        let comment =  Comment(userName: userDefaults.string(forKey: USER_NAME) ?? UUID().uuidString, text: self.commentTextField.text!)
        self.commentTextField.text = ""
        self.addComment(comment: comment)
        
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
            cell.detailLbl.textColor = UIColor(hexString: "FFDA3A")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MatchDetailCVC
        cell.detailLbl.textColor = UIColor(hexString: "FFDA3A")
        cell.detailLbl.font = UIFont.boldSystemFont(ofSize:  cell.detailLbl.font.pointSize)
        navigateToScreen(index: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MatchDetailCVC
        cell.detailLbl.textColor = UIColor.white
        cell.detailLbl.font = UIFont.systemFont(ofSize:  cell.detailLbl.font.pointSize)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/4) - 10, height: collectionView.frame.height)
    }
}




//MARK: Comment section implementation
extension MatchDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as? CommentCell {
            cell.selectionStyle = .none
            cell.initCellData(userName: comments[indexPath.row].userName, comment: comments[indexPath.row].text)
            return cell
        }
        return UITableViewCell()
    }
    
    
    
    
    func fetchComments(completion: @escaping ([Comment]) -> Void) {
        database.child("Matches").child((data?.id)!).child("comments").observe(.childAdded) { (snapshot) in
            if let commentData = snapshot.value as? [String: Any],
               let id = commentData["userName"] as? String,
               let text = commentData["text"] as? String {
                let comment = Comment(userName: id, text: text)
                self.comments.append(comment)
                DispatchQueue.main.async(execute: {
                    self.commentsTableView.reloadData()
                })
            }
        }
        
        
        database.child("Matches").child((data?.id)!).child("comments").observeSingleEvent(of: .value) { snapshot in
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let commentData = snapshot.value as? [String: Any],
                   let id = commentData["userName"] as? String,
                   let text = commentData["text"] as? String {
                    let comment = Comment(userName: id, text: text)
                    self.comments.append(comment)
                }
            }
            completion(self.comments)
        }
    }
    
    func addComment(text: String) {
        let comment = Comment(userName: userDefaults.string(forKey: USER_NAME)!, text: text)
        self.addComment(comment: comment)
        self.fetchComments(completion: {_ in 
            DispatchQueue.main.async(execute: {
                self.commentsTableView.reloadData()
            })
        }) // Refresh comments after adding a new one
    }
    
    func addComment(comment: Comment) {
        let commentData = [
            "userName": comment.userName,
            "text": comment.text
        ] as [String : Any]
        
        database.child("Matches").child((data?.id)!).child("comments").child(UUID().uuidString).setValue(commentData)
        DispatchQueue.main.async(execute: {
            self.commentsTableView.reloadData()
        })
    }
}
