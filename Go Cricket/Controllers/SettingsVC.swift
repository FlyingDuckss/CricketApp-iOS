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
