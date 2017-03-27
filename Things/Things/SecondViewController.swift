//
//  SecondViewController.swift
//  Things
//
//  Created by Guillermo Moran on 3/27/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var taskDescInput: UITextField!
    @IBOutlet weak var taskNameInput: UITextField!
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addTask(_ sender: Any) {
        
        if (taskNameInput.text == "" || taskDescInput.text == "") {
            
            let alert = UIAlertController(title: "Error", message: "Please enter a valid task name and description.", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        taskMGR.addTask(name: taskNameInput.text!, description: taskDescInput.text!)
        
        taskNameInput.text = ""
        taskDescInput.text = ""
        
        self.tabBarController?.selectedIndex = 0
        
        
        
        
    }
    

}

