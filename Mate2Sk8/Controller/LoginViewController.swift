//
//  LoginViewController.swift
//  Mate2Sk8
//
//  Created by Maximo Hinojosa on 1/13/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var textFieldWithPlaceholder: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var emailLine: UIView!
    @IBOutlet weak var passwordLine: UIView!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var accountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        hideKeyboardTapped()
        updateUI()
        updateNavBar()
    }
    
    func updateNavBar() {
        title = "Login"
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        guard let email = email.text else {return}
        guard let password = password.text else {return}
        
        if email.count <= 0 || password.count <= 0 {
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            Auth.auth().signIn(withEmail: email, password: password){ (user, error) in
                if(error == nil){
                    print("No error")
                    let destinationVC = HomeViewController()
                    self.navigationController?.pushViewController(destinationVC, animated: true)
                    
                } else {
                    
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    @IBAction func signUpAction(_ sender: UIButton) {
        let destinationVC = SignupViewController()
        self.navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    func updateUI() {
        loginBtn.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        loginBtn.layer.shadowColor = UIColor.black.cgColor
        loginBtn.layer.shadowRadius = 5
        loginBtn.layer.shadowOpacity = 0.5
        
        signupBtn.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        signupBtn.layer.shadowColor = UIColor.black.cgColor
        signupBtn.layer.shadowRadius = 5
        signupBtn.layer.shadowOpacity = 0.5
        
        emailLine.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        emailLine.layer.shadowColor = UIColor.black.cgColor
        emailLine.layer.shadowRadius = 5
        emailLine.layer.shadowOpacity = 0.5
        
        passwordLine.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        passwordLine.layer.shadowColor = UIColor.black.cgColor
        passwordLine.layer.shadowRadius = 5
        passwordLine.layer.shadowOpacity = 0.5
        
        accountLabel.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        accountLabel.layer.shadowColor = UIColor.black.cgColor
        accountLabel.layer.shadowRadius = 5
        accountLabel.layer.shadowOpacity = 0.5
        
    }
    
    
}
