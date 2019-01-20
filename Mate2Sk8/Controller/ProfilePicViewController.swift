//
//  ProfileViewController.swift
//  Mate2Sk8
//
//  Created by Maximo Hinojosa on 1/14/19.
//  Copyright © 2019 Maximo Hinojosa. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class ProfilePicViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var iconImage: UIImageView!
    var profilePictureToSave: UIImage?
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavbar()
        iconImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectedProfileImageView)))
        iconImage.isUserInteractionEnabled = true
        iconImage.setRounded()
        iconImage.dropShadow(scale: true)
    }
    
    @objc func handleSelectedProfileImageView() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        navigationController?.present(picker, animated: true, completion: nil)
    }
    
    // selects an image from your iphone photo gallery
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        var selectedImageFromPicker: UIImage?
        
        // edited image becomes the selected image
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectedImageFromPicker = editedImage
            
        } else if let originalImage =
            info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            selectedImageFromPicker = originalImage
        }
        
        // replace the image icon to sleceted image
        if let selectedImage = selectedImageFromPicker {
            iconImage.image = selectedImage
            
            // save image into database with use id
            if Auth.auth().currentUser != nil {
                guard let userId = Auth.auth().currentUser?.uid else {
                    return
                }
                let profileImage: UIImage?
                let storageRef = Storage.storage().reference().child("images").child("\(userId).")
                
                if let selectedToBeProfileImage =  info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
                    
                    profileImage = selectedToBeProfileImage
                    
                    
                    let profileImageData = profileImage?.pngData()
                    
                    storageRef.putData(profileImageData!, metadata: nil){ (metadata, error) in
                        
                        if error != nil {
                            print(error as Any)
                            return
                        }
                    }
                }
            }
        }
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    // cancel animation enabled
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextBtnVC(_ sender: UIButton) {
        
        let destinationVC = BioViewController()
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func setupNavbar() {
        
        title = "Profile Setup"
    }
    
}
