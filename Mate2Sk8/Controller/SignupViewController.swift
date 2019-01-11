//
//  RegisterViewController.swift
//  Mate2Sk8
//
//  Created by Maximo Hinojosa on 1/9/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var retypePassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func signUpAction(_ sender: Any) {
        guard let firstName = firstName.text else {return}
        guard let lastName = lastName.text else {return}
        guard let email = email.text else {return}
        guard let password = password.text else {return}
        
        
        if firstName.count == 0{
            let alertController = UIAlertController(title: "Name Error", message: "Please enter your name.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else if lastName.count == 0{
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
            if error == nil {
                self.performSegue(withIdentifier: "signupToHome", sender: self)
            } else {
                
                let alertCotroller = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertCotroller.addAction(defaultAction)
                self.present(alertCotroller, animated: true, completion: nil)
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


}
