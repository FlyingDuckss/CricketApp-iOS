//
//  HomeVC.swift
//  Go Cricket
//
//  Created by Usama on 03/10/2024.
//

import UIKit
import FirebaseDatabase
import SDWebImage
import SafariServices

class HomeVC: UIViewController {

    @IBOutlet weak var latestMatchView: UIView!
    @IBOutlet weak var exploreCollectionView: UICollectionView!
    @IBOutlet weak var subheadingLbl: UILabel!
    @IBOutlet weak var headlineLbl: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var topNewsView: UIView!
    
    @IBOutlet weak var teamNameTwo: UILabel!
    @IBOutlet weak var teamScoreTwo: UILabel!
    @IBOutlet weak var teamImageTwo: UIImageView!
    @IBOutlet weak var teamScoreOne: UILabel!
    @IBOutlet weak var teamNameOne: UILabel!
    @IBOutlet weak var teamImageOne: UIImageView!
    @IBOutlet weak var matchTitile: UILabel!
    
    
    
    var ref: DatabaseReference!
    var exploreRef: DatabaseReference!
    var newsURL: String?
    var exploreItems: [ExploreModel] = []
    var data: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home_icon_unselected"), selectedImage: UIImage(named: "home_icon_selected"))
        exploreCollectionView.delegate = self
        exploreCollectionView.dataSource = self
        
        ProgressHUD.animate("Please wait...", .ballVerticalBounce)
        initGesture()
        fetchNews()
        fetchExploreOptions()
        fetchLatestMatch()
        
        
    }
    
    func fetchLatestMatch() {
        self.latestMatchView.layer.cornerRadius = 10
        latestMatchView.layer.borderWidth = 2
        latestMatchView.layer.borderColor = UIColor(hexString: "676767")!.cgColor
        
        
        
        
        let urlString = "https://api.cricapi.com/v1/currentMatches?apikey=\(API_KEY)&offset=0"

        if let url = URL(string: urlString) {
            networkManager.request(url: url, method: "GET") { (result: Result<MatchModel, NetworkError>) in
                ProgressHUD.dismiss()
                switch result {
                case .success(let team):
                    print("success")
                    self.data = team.data?.first
                    DispatchQueue.main.async(execute: {
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
                        self.teamImageTwo.sd_setImage(with: URL(string: (self.data?.teamInfo?[1].img)!))
                    })
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
        
        
        
        
    }
    
    func initGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(newsTapped))
        topNewsView.addGestureRecognizer(tapGesture)
        topNewsView.isUserInteractionEnabled = true
    }
    
    @objc func newsTapped() {
        if let url = self.newsURL {
            let newURL = URL(string: url)
            let safariVC = SFSafariViewController(url: newURL!)
            safariVC.delegate = self // Optional: if you want to handle delegate methods
            present(safariVC, animated: true, completion: nil)
        }
    }
    
    func fetchNews() {
        self.newsImageView.contentMode = .scaleAspectFill
        self.newsImageView.layer.cornerRadius = 10
        self.newsImageView.layer.borderWidth = 1
        self.newsImageView.layer.borderColor = ButtonColor?.cgColor
        
        ref = Database.database().reference()
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
                    guard let value = snapshot.value as? [String: Any],
                          let topNews = value["TopNews"] as? [String: Any] else {
                        print("TopNews data not found")
                        return
                    }
                    
                    // Extracting values from TopNews
                    if let headline = topNews["Headline"] as? String,
                       let imageURL = topNews["imageURL"] as? String,
                       let subheading = topNews["subheading"] as? String,
                       let url = topNews["url"] as? String {
                        self.headlineLbl.text = headline
                        self.subheadingLbl.text = subheading
                        self.newsImageView.sd_setImage(with: URL(string: imageURL))
                        self.newsURL = url
                        print("Headline: \(headline)")
                        print("Image URL: \(imageURL)")
                        print("Subheading: \(subheading)")
                    }
                }) { error in
                    print("Error fetching TopNews data: \(error.localizedDescription)")
                }
    }
    
    func fetchExploreOptions() {
        exploreRef = Database.database().reference()
        exploreRef.observeSingleEvent(of: .value, with: { snapshot in
                // Check if the snapshot has a value
            self.exploreItems.removeAll()
                guard let value = snapshot.value as? [String: Any],
                      let explore = value["Explore"] as? [String: Any] else {
                    print("Error: Explore data not found.")
                    return
                }
                
                // Extract and print each option
                for (key, option) in explore {
                    if let optionDetails = option as? [String: Any],
                       let imageURL = optionDetails["imageURL"] as? String,
                       let title = optionDetails["title"] as? String,
                       let url = optionDetails["url"] as? String {
                        print("Key: \(key)")
                        print("Title: \(title)")
                        print("Image URL: \(imageURL)")
                        print("URL: \(url)")
                        print("-----------------------")
                        
                        let model = ExploreModel(title: title, url: url, imageURL: imageURL)
                        self.exploreItems.append(model)
                    }
                }
            DispatchQueue.main.async(execute: {
                self.exploreCollectionView.reloadData()
            })
                
            }) { error in
                print("Error fetching Explore options: \(error.localizedDescription)")
            }
    }
}

extension HomeVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        // Handle when the Safari view controller is dismissed
        controller.dismiss(animated: true, completion: nil)
    }
}


extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exploreItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == exploreCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreCVC", for: indexPath) as! ExploreCVC
            cell.initCell(data: exploreItems[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == exploreCollectionView {
            let url = URL(string: exploreItems[indexPath.row].url!)
            let safariVC = SFSafariViewController(url: url!)
            safariVC.delegate = self
            present(safariVC, animated: true, completion: nil)
        }
    }
}
