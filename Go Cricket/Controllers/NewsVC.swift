//
//  NewsVC.swift
//  Go Cricket
//
//  Created by Usama on 06/10/2024.
//

import UIKit
import SafariServices
import FirebaseDatabase

class NewsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference!
    var newsItems: [News] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "news_icon_unselected"), selectedImage: UIImage(named: "news_icon_selected"))
        view.backgroundColor = .black
        ProgressHUD.animate("Please wait...", .ballVerticalBounce)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .black
        
        fetchNews()
    }
    
    func fetchNews() {
        ref = Database.database().reference()
        ref.observeSingleEvent(of: .value, with: { snapshot in
                // Check if the snapshot has a value
            self.newsItems.removeAll()
                guard let value = snapshot.value as? [String: Any],
                      let explore = value["News"] as? [String: Any] else {
                    print("Error: Explore data not found.")
                    return
                }
                
                // Extract and print each option
                for (key, option) in explore {
                    if let optionDetails = option as? [String: Any],
                       let headline = optionDetails["headlines"] as? String,
                       let imageURL = optionDetails["imageURL"] as? String,
                       let subheading = optionDetails["subheading"] as? String,
                        let newsURL = optionDetails["url"] as? String{
                        
                        let model = News(headline: headline, subheading: subheading, imageURL: imageURL, url: newsURL)
                        self.newsItems.append(model)
                    }
                }
            DispatchQueue.main.async(execute: {
                ProgressHUD.dismiss()
                self.tableView.reloadData()
            })
                
            }) { error in
                print("Error fetching Explore options: \(error.localizedDescription)")
            }
    }
}

extension NewsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell {
            cell.initData(model: newsItems[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newURL = URL(string: newsItems[indexPath.row].url ?? "")
        let safariVC = SFSafariViewController(url: newURL!)
        present(safariVC, animated: true, completion: nil)
        
    }
    
    
}
