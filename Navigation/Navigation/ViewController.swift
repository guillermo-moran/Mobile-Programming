//
//  ViewController.swift
//  Navigation
//
//  Created by Guillermo Moran on 2/20/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userTxt: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let secondVC : SecondViewController = segue.destination as! SecondViewController
        
        secondVC.name = userTxt.text!
        
        
        
        
    }
    
}

