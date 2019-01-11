//
//  RoundButton.swift
//  Mate2Sk8
//
//  Created by Maximo Hinojosa on 1/9/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
