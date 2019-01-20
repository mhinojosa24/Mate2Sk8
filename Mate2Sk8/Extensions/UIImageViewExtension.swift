//
//  UIImageViewExtension.swift
//  Mate2Sk8
//
//  Created by Maximo Hinojosa on 1/14/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setRounded() {
        self.layer.cornerRadius = (self.frame.size.width / 2) //instead of let radius = CGRectGetWidth(self.frame) / 2
        self.layer.masksToBounds = true
    }
}

