//
//  ThirdViewController.swift
//  GradeCalculator
//
//  Created by Guillermo Moran on 2/6/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var gradeLabel: UILabel!
    
    @IBOutlet weak var hwSlider: UISlider!
    @IBOutlet weak var hwLabel: UILabel!
    
    @IBOutlet weak var examsSlider: UISlider!
    @IBOutlet weak var examsLabel: UILabel!
    
    @IBOutlet weak var finalSlider: UISlider!
    @IBOutlet weak var finalLabel: UILabel!
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add a Navigation Bar
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 54))
        
        
        let navItem = UINavigationItem(title: "Algorithms");
        navBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        navBar.barTintColor = UIColor(displayP3Red: 10.0/255.0, green: 10.0/255.0, blue: 10.0/255.0, alpha: 1.0)
        navBar.isTranslucent = false
        self.view.addSubview(navBar);
        
        navBar.setItems([navItem], animated: false);
        
        //Load label values
        let hwMin = hwSlider.minimumValue
        let hwMax = hwSlider.maximumValue
        hwLabel.text = String.localizedStringWithFormat("%.f/%.f", hwMin, hwMax)
        
        //Load label values
        let examsMin = examsSlider.minimumValue
        let examsMax = examsSlider.maximumValue
        examsLabel.text = String.localizedStringWithFormat("%.f/%.f", examsMin, examsMax)
        
        //Load label values
        let finalMin = finalSlider.minimumValue
        let finalMax = finalSlider.maximumValue
        finalLabel.text = String.localizedStringWithFormat("%.f/%.f", finalMin, finalMax)
        
        gradeLabel.text = "F"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        
        
        let hwVal = hwSlider.value
        let hwMax = hwSlider.maximumValue
        hwLabel.text = String.localizedStringWithFormat("%.f/%.f", hwVal, hwMax)
        
        let examsVal = examsSlider.value
        let examsMax = examsSlider.maximumValue
        examsLabel.text = String.localizedStringWithFormat("%.f/%.f", examsVal, examsMax)
        
        let finalVal = finalSlider.value
        let finalMax = finalSlider.maximumValue
        finalLabel.text = String.localizedStringWithFormat("%.f/%.f", finalVal, finalMax)
        
        
        let total = hwVal + examsVal + finalVal
        
        if (total < 60) {
            gradeLabel.text = "F"
        }
        else if (total > 60 && total < 70) {
            gradeLabel.text = "D"
        }
        else if (total > 70 && total < 80) {
            gradeLabel.text = "C"
        }
        else if (total > 80 && total < 90) {
            gradeLabel.text = "B"
        }
        else if (total > 90) {
            gradeLabel.text = "A"
        }

        
    }

}
