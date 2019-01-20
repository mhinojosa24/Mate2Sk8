//
//  HomeViewController.swift
//  Mate2Sk8
//
//  Created by Maximo Hinojosa on 1/13/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class HomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
   
    var slides: [Slide] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scrollView.delegate = self
        slides = createSlide()
        setupSlideScrollView(slides: slides)
        
        scrollView?.contentSize.height = 0
        scrollView?.alwaysBounceVertical = false
        scrollView?.alwaysBounceHorizontal = false
        scrollView?.showsHorizontalScrollIndicator = false
        
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logOutAction))
    }
    
    override func viewDidLayoutSubviews() {
        
        scrollView?.isScrollEnabled = true
        let totalSlides = slides.count
        let viewWidth = view.bounds.width
        
        let width = viewWidth * CGFloat(totalSlides)
        scrollView?.contentSize = CGSize(width: width, height: 0)
    }
    
    @objc func logOutAction() {
        do {
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    func createSlide() -> [Slide] {
        
        let profileIimage: UIImage?
        
        
        if Auth.auth().currentUser != nil {
            
            let userRef = Storage.storage().reference(withPath: "images/cL36JMG6CHY0SZNfi51PljtiruV2")
            
            
        }
        
        
        
        let slide: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
//        slide.imageView.image = ??
//        slide.nameLabel.text = ??
//        slide.DescriptionLabel.text = ??
        
        
        return [slide]
        
    }

    
    func setupSlideScrollView(slides: [Slide]) {
        
        scrollView?.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView?.contentSize =  CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)

        
        for i in 0 ..< slides.count {
            
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i) , y: 0, width: view.frame.width, height: view.frame.height)
            scrollView?.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        //        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        //
        //        // vertical
        //        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        //        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        //
        //        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        //        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        //
        //
        //        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        //
        //        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
        //
        //            slides[0].imageView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
        //            slides[1].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
        //
        //        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
        //            slides[1].imageView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
        //            slides[2].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
        //
        //        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
        //            slides[2].imageView.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
        //
        //
        //        }
        //
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        setupSlideScrollView(slides: slides)
    }
}
