//
//  BioViewController.swift
//  Mate2Sk8
//
//  Created by Maximo Hinojosa on 1/15/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit

class BioViewController: UIViewController {

    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var linkupBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavbar()
        updateUI()
        
        textViewSetup(textView)
    }

    func textViewSetup(_ textView: UITextView) {
        textView.text = "Bio"
        textView.textColor = UIColor.lightGray
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        
        if textView.text.isEmpty {
            textView.text = "Bio"
            textView.textColor = UIColor.lightGray
        }
    }
    
    
    
    
    
    
    @IBAction func linkupButton(_ sender: UIButton) {
        let destinationVC = HomeViewController()
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func updateUI() {
        linkupBtn.dropShadow(scale: true)
    }

    func setupNavbar() {
        title = "Account Setup"
    }
}
