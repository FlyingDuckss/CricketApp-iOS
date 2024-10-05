//
//  SignupVC.swift
//  Go Cricket
//
//  Created by Usama on 03/10/2024.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignupVC: UIViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    

    func initUI() {
        nameTextField.backgroundColor = .clear
        nameTextField.textColor = .white
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.borderColor = UIColor.white.cgColor
        nameTextField.layer.cornerRadius = 10
        nameTextField.attributedPlaceholder = NSAttributedString(
            string: "Type Here",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        
        usernameTextField.backgroundColor = .clear
        usernameTextField.textColor = .white
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.borderColor = UIColor.white.cgColor
        usernameTextField.layer.cornerRadius = 10
        usernameTextField.attributedPlaceholder = NSAttributedString(
            string: "Type Here",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        
        emailTextField.backgroundColor = .clear
        emailTextField.textColor = .white
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.white.cgColor
        emailTextField.layer.cornerRadius = 10
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Type Here",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        
        passwordTextField.backgroundColor = .clear
        passwordTextField.textColor = .white
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Type Here",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        
        confirmPasswordTextField.backgroundColor = .clear
        confirmPasswordTextField.textColor = .white
        confirmPasswordTextField.layer.borderWidth = 1
        confirmPasswordTextField.layer.borderColor = UIColor.white.cgColor
        confirmPasswordTextField.layer.cornerRadius = 10
        confirmPasswordTextField.attributedPlaceholder = NSAttributedString(
            string: "Type Here",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        
        nextBtn.tintColor = ButtonColor
        nextBtn.layer.cornerRadius = 10
        nextBtn.setAttributedTitle(NSAttributedString(
            string: "Next",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        ), for: .normal)
        
    }
    
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        if nameTextField.text == "" || usernameTextField.text == "" || emailTextField.text == "" || passwordTextField.text == "" || confirmPasswordTextField.text == "" {
            let alert = UIAlertController(title: "Error", message: "All fields are required", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if passwordTextField.text != confirmPasswordTextField.text {
            let alert = UIAlertController(title: "Error", message: "Password does not matched", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        signUp(withEmail: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        
    }
    
    
    private func signUp(withEmail email: String, password: String) {
        ProgressHUD.animate("Please wait...", .ballVerticalBounce)
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            ProgressHUD.dismiss()
            
            if let error = error {
                self.showAlert(title: "Error", desc: error.localizedDescription)
                return
            }
            
            let userData: [String: String] = ["uid": result?.user.uid ?? "", "email": result?.user.email ?? ""]
            userDefaults.setValue(result?.user.uid, forKey: USER_UID)
            print("User signed up successfully: \(String(describing: result?.user.email))")
            let databaseRef = Database.database().reference()
            databaseRef.child("users").child(result?.user.uid ?? "").setValue(userData)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ChooseFavouriteTeam")
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            
        }
    }
}
