//
//  UIViewExtension.swift
//  Mate2Sk8
//
//  Created by Maximo Hinojosa on 1/15/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit


extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowRadius = 5
        
        
    }
    
//    firstLine.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
//    firstLine.layer.shadowColor = UIColor.black.cgColor
//    firstLine.layer.shadowRadius = 5
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
