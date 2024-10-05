//
//  ViewController.swift
//  Go Cricket
//
//  Created by Usama on 02/10/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var logoImageViewHorizontalConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }


    func initUI() {
        DispatchQueue.main.async(execute: {
            self.loginBtn.layer.cornerRadius = 10
            self.loginBtn.tintColor = ButtonColor
            self.loginBtn.setTitleColor(.black, for: .normal)
            self.loginBtn.alpha = 0
            
            self.signupBtn.layer.cornerRadius = 10
            self.signupBtn.tintColor = UIColor.clear
            self.signupBtn.alpha = 0
        })
        
        
        
        logoImageViewHorizontalConstraint.constant = -200

            UIView.animate(withDuration: 1.0) {
                self.view.layoutIfNeeded()
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            UIView.animate(withDuration: 1.0) {
                self.loginBtn.alpha = 1
                self.signupBtn.alpha = 1
                self.view.layoutIfNeeded()
            }
        })
    }
    
    @IBAction func loginBtnCLicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginVC")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func signupBtnClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignupVC")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
}

