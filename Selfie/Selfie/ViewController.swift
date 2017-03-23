//
//  ViewController.swift
//  Selfie
//
//  Created by Guillermo Moran on 3/22/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func takePhoto(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            imagePicker.sourceType = .camera
            
            if (UIImagePickerController.isCameraDeviceAvailable(.front)) {
                imagePicker.cameraDevice = .front
            }
            else {
                imagePicker.cameraDevice = .rear
            }
        }
        else {
            imagePicker.sourceType = .photoLibrary
        }
        
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
            photoView.image = image
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func postPhoto(_ sender: Any) {
        
        let social = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        
        social?.add(photoView.image)
        self.present(social!, animated: true, completion: nil)
        
        
    }
    
    

}

