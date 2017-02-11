//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Guillermo Moran on 1/25/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.changeBgToRandomBackgroundColor), userInfo: nil, repeats: true)
        
        

        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func getRandomColor() -> UIColor{
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    func changeBgToRandomBackgroundColor() {
        self.view.backgroundColor = getRandomColor()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func welcomeButtonPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Welcome to Mobile Programming", message: "Hi.", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    
    }

}

