//
//  SecondViewController.swift
//  Navigation
//
//  Created by Guillermo Moran on 2/20/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    
    var name = String();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = name

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
