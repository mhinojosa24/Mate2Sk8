//
//  LandingViewController.swift
//  Mate2Sk8
//
//  Created by Maximo Hinojosa on 1/13/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit
import Firebase

class LandingViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        if Auth.auth().currentUser != nil {
            let destinationVC = HomeViewController()
            self.navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
    @IBAction func signinAction(_ sender: UIButton) {
        let destinationVC = LoginViewController()
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func signupAction(_ sender: UIButton) {
        let destinationVC = SignupViewController()
        
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func updateUI() {
        
        titleLabel.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        titleLabel.layer.shadowColor = UIColor.black.cgColor
        titleLabel.layer.shadowRadius = 5
        titleLabel.layer.shadowOpacity = 0.5
        
        signinBtn.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        signinBtn.layer.shadowColor = UIColor.black.cgColor
        signinBtn.layer.shadowRadius = 5
        signinBtn.layer.shadowOpacity = 0.5
        
        signupBtn.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        signupBtn.layer.shadowColor = UIColor.black.cgColor
        signupBtn.layer.shadowRadius = 5
        signupBtn.layer.shadowOpacity = 0.5
    }
}

