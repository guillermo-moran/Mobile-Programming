//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Guillermo Moran on 4/5/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(self.didTapView))
        self.view.addGestureRecognizer(tapRecognizer)
        
        //NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        //NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    //keyboard
    
    func didTapView(){
        self.view.endEditing(true)
    }
    /*
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            //self.view.frame.origin.y -= keyboardSize.height
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            //self.view.frame.origin.y += keyboardSize.height
        }
    }
 */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func logIn(_ sender: Any) {
        printAccounts()
    }
    
    @IBAction func register(_ sender: Any) {
        
        addNewAccount(user: usernameField.text!, pass: passwordField.text!)
        
    }
    
    func addNewAccount (user : String, pass : String) {
        let newAccount = Accounts (context: context)
        
        newAccount.username = user
        newAccount.password = pass
        appDelegate.saveContext()
    }
    
    var userAccounts = [Accounts]()
    
    func printAccounts() {
        do {
            userAccounts = try context.fetch(Accounts.fetchRequest())
            
            for each in userAccounts {
                print ("Username: \(each.username!) \n Password: \(each.password!)\n")
            }
        }
        catch {}
    }

}

