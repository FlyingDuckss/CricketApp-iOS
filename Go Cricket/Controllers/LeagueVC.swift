//
//  LeagueVC.swift
//  Go Cricket
//
//  Created by Usama on 05/10/2024.
//

import UIKit

class LeagueVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let refreshControl = UIRefreshControl()
    var data: [Data] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        ProgressHUD.animate("Please wait...", .ballVerticalBounce)


        tableView.delegate = self
        tableView.dataSource = self
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        tableView.addSubview(refreshControl) //
        fetchLatestMatches()
    }
    
    @objc func refresh() {
        ProgressHUD.animate("Please wait...", .ballVerticalBounce)
        fetchLatestMatches() 
    }
    
    func fetchLatestMatches() {
        data.removeAll()
        let urlString = "https://api.cricapi.com/v1/currentMatches?apikey=\(API_KEY)&offset=0"

        if let url = URL(string: urlString) {
            networkManager.request(url: url, method: "GET") { (result: Result<MatchModel, NetworkError>) in
                ProgressHUD.dismiss()
                switch result {
                case .success(let team):
                    print("success")
                    self.data = team.data ?? []
                    DispatchQueue.main.async(execute: {
                        self.tableView.reloadData()
                        self.refreshControl.endRefreshing()
                        ProgressHUD.dismiss()

                    })
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
}

extension LeagueVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell", for: indexPath) as? LeagueCell {
            cell.initData(data: data[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MatchDetailVC") as! MatchDetailVC
        vc.data = data[indexPath.row]
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
