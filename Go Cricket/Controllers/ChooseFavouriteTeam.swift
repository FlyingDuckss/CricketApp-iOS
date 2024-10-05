//
//  ChooseFavouriteTeam.swift
//  Go Cricket
//
//  Created by Usama on 03/10/2024.
//

import UIKit
import FirebaseDatabase
import SDWebImage

class ChooseFavouriteTeam: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var teams: [Country] = []
    var selectedTeams:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        
        ProgressHUD.animate("Please wait...", .ballVerticalBounce)
        
        let urlString = "https://api.cricapi.com/v1/countries?apikey=\(API_KEY)&offset=0"

        if let url = URL(string: urlString) {
            networkManager.request(url: url, method: "GET") { (result: Result<ApiResponse_TeamModel, NetworkError>) in
                ProgressHUD.dismiss()
                switch result {
                case .success(let team):
                    self.teams = team.data
                    DispatchQueue.main.async(execute: {
                        self.tableView.reloadData()
                    })
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        ProgressHUD.animate("Please wait...", .ballVerticalBounce)
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child("users").child(userDefaults.value(forKey: USER_UID) as! String).child("favouriteTeams").setValue(selectedTeams)
        ProgressHUD.dismiss()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}


extension ChooseFavouriteTeam: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "favouriteCell", for: indexPath) as? favouriteCell {
            cell.selectionStyle = .default
            cell.teamNameLbl.text = teams[indexPath.row].name
            cell.teamDescLbl.isHidden = true
            cell.tvcImageImageView.sd_setImage(with: URL(string: teams[indexPath.row].genericFlag))
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTeams.append(teams[indexPath.row].name)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
}
