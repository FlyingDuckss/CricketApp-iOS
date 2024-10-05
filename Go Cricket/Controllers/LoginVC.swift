//
//  LoginVC.swift
//  Go Cricket
//
//  Created by Usama on 03/10/2024.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordTxtView: UITextField!
    @IBOutlet weak var emailTxtView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTxtView.isSecureTextEntry = true

        emailTxtView.attributedPlaceholder = NSAttributedString(
            string: "Email Here",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        
        passwordTxtView.attributedPlaceholder = NSAttributedString(
            string: "Password Here",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        
        emailTxtView.layer.cornerRadius = 10
        passwordTxtView.layer.cornerRadius = 10
        
        passwordTxtView.layer.borderWidth = 1
        passwordTxtView.layer.borderColor = ButtonColor?.cgColor
        
        emailTxtView.layer.borderWidth = 1
        emailTxtView.layer.borderColor = ButtonColor?.cgColor
        
        loginBtn.layer.borderColor = ButtonColor?.cgColor
        loginBtn.layer.borderWidth = 1
        loginBtn.layer.cornerRadius = 10
    }
    
    
    @IBAction func logibnBtnClicked(_ sender: Any) {
        ProgressHUD.animate("Please wait...", .ballVerticalBounce)
        
        let email = emailTxtView.text ?? ""
        let password = passwordTxtView.text ?? ""
        
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            DispatchQueue.main.async(execute: {
                ProgressHUD.dismiss()
            })
            if let error = error {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                        return
                    }
                    
                    // Login successful
                    if let _ = authResult?.user {
                        userDefaults.set(true, forKey: IS_LOGGEDIN)
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController")
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true)
                    }
                }
        
    }
}
