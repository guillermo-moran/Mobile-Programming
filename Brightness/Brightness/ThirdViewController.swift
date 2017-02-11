//
//  ThirdViewController.swift
//  Brightness
//
//  Created by Guillermo Moran on 2/1/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var brightnessPercentLabel: UILabel!
    @IBOutlet weak var brightnessSlider: UISlider!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func brightnessChanged(_ sender: Any) {
        
        NSLog(String(brightnessSlider.value));
        
        brightnessPercentLabel.text = String.localizedStringWithFormat("%.f %%", brightnessSlider.value)
        
        UIScreen.main.brightness = CGFloat(brightnessSlider.value/100)
        
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
