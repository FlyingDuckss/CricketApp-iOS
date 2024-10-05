//
//  SettingsVC.swift
//  Go Cricket
//
//  Created by Usama on 06/10/2024.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var logoutBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        logoutBtn.tintColor = ButtonColor
        logoutBtn.layer.cornerRadius = 10
        
        self.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "setting_icon_unselected"), selectedImage: UIImage(named: "setting_icon_selected"))
        view.backgroundColor = .black
    }
    
    @IBAction func logoutBtnClicked(_ sender: Any) {
        userDefaults.set(false, forKey: IS_LOGGEDIN)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginVC")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
