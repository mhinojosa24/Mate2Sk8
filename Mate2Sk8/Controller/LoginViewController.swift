//
//  LoginController.swift
//  Mate2Sk8
//
//  Created by Maximo Hinojosa on 1/9/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var textFieldWithPlaceholder: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}
