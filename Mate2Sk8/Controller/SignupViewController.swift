//
//  SignupViewController.swift
//  Mate2Sk8
//
//  Created by Maximo Hinojosa on 1/13/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SignupViewController: UIViewController {
    
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var retypePassword: UITextField!
    @IBOutlet weak var firstLine: UIView!
    @IBOutlet weak var lastLine: UIView!
    @IBOutlet weak var emailLine: UIView!
    @IBOutlet weak var passwordLine: UIView!
    @IBOutlet weak var retypeLine: UIView!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    var iconImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        hideKeyboardTapped()
        self.navigationItem.setHidesBackButton(true, animated: true)
        updateUI()
        setupNavbar()
    }
    
    
    
    
    @IBAction func signUpAction(_ sender: Any) {
        guard let firstName = firstName.text else {return}
        guard let lastName = lastName.text else {return}
        guard let email = email.text else {return}
        guard let password = password.text else {return}
        
        
        if firstName == ""{
            let alertController = UIAlertController(title: "Name Error", message: "Please enter your name.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else if lastName == ""{
            let alertController = UIAlertController(title: "Name Error", message: "Please enter your last name.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else if !isValidEmail(email: email){
            
            let alertController = UIAlertController(title: "Email Error", message: "Please enter your email.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else if password.count < 8 {
            let alertController = UIAlertController(title: "Re-type password", message: "Password has to be more than 6 characters.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else if password != retypePassword.text {
            let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            Auth.auth().createUser(withEmail: email, password: password){ (user,error) in
                
                if error != nil {
                    let alertCotroller = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertCotroller.addAction(defaultAction)
                    
                    self.present(alertCotroller, animated: true, completion: nil)
                    
                } else {
                    //user is created with unique id and stored in database
                    
                    guard let userID = Auth.auth().currentUser?.uid else { return }

                    let ref = Database.database().reference()
                    let userReferences = ref.child("users").child(userID)
                    let values = ["name": firstName, "email": email]
                    userReferences.updateChildValues(values, withCompletionBlock: { (error, ref) in
                        if error != nil {
                            print("error")
                            print(error!)
                            return
                        }
                    })
                
                    let destinationVC = ProfilePicViewController()
                    self.navigationController?.pushViewController(destinationVC, animated: true)
                    
                }
            }
        }
    }
    
    
    
    
    func isValidEmail(email:String?) -> Bool {
        
        guard email != nil else { return false }
        print(email!)
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        print(pred.evaluate(with: email))
        return pred.evaluate(with: email)
    }
    
    
    @IBAction func loginAction(_ sender: UIButton) {
        let destinationVC = LoginViewController()
        
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func updateUI() {
        firstLine.dropShadow(scale: true)
        lastLine.dropShadow(scale: true)
        emailLine.dropShadow(scale: true)
        passwordLine.dropShadow(scale: true)
        retypeLine.dropShadow(scale: true)
        signupBtn.dropShadow(scale: true)
        accountLabel.dropShadow(scale: true)
        loginBtn.dropShadow(scale: true)
    }
    
    func setupNavbar() {
        
        title = "SIGN UP"
        
    }
}
