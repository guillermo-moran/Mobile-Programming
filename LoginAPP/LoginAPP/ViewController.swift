//
//  ViewController.swift
//  LoginAPP
//
//  Created by Guillermo Moran on 2/8/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //Dismiss Keyboard
    func dismissKeyboard(){
        self.view.endEditing(true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userField.delegate = self
        self.passField.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        dismissKeyboard()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return false
    }
    
    
    @IBAction func login(_ sender: Any) {
        
        let user = "cosc"
        let pass = "3326"
        
        let isValidLogin = (userField.text == user && passField.text == pass)
        
        
        if (isValidLogin) {
            
            /*
            
            statusLabel.text = String(format: "Welcome, %@", user)
            
            let alert = UIAlertController(title: "Success", message: String(format: "Welcome, %@", user), preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
 
            */
            
            let goToWelcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "loginApp.welcomeVC")
            as! WelcomeViewController
            
            goToWelcomeVC.modalTransitionStyle = .flipHorizontal
            
            self.present(goToWelcomeVC, animated: true, completion: nil)
        }
            
        else {
            
            statusLabel.text = String(format: "Incorrect Username/Password")
            
            let alert = UIAlertController(title: "Failure", message: String(format: "Incorrect Username/Password"), preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
    }


}

