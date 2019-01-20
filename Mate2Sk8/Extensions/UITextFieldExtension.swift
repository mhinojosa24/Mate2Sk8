//
//  Extension.swift
//  Mate2Sk8
//
//  Created by Maximo Hinojosa on 1/12/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit

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

