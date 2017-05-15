//
//  ViewController.swift
//  SaveLoadUserDefaults
//
//  Created by Guillermo Moran on 4/12/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveData(_ sender: Any) {
        
        userDefaults.set(true, forKey:"key1")
        userDefaults.set(123, forKey:"key2")
        userDefaults.set("I am a saved string", forKey: "key3")
        
        let array = ["1","2"]
        userDefaults.set(array, forKey: "key4")
    }
    
    
    @IBAction func loadData(_ sender: Any) {
        
        print(userDefaults.bool(forKey: "key1"))
        print(userDefaults.integer(forKey: "key2"))
        print(userDefaults.object(forKey: "key3") as Any!)
        
        let array = userDefaults.object(forKey: "key4") as? [String]
        print(array!)
        
        
        
        
    }

}

