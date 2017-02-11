//
//  FirstViewController.swift
//  GradeCalculator
//
//  Created by Guillermo Moran on 2/6/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

// Mobile Programming View Controller

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var gradeLabel: UILabel!
    
    @IBOutlet weak var miniProjectsScoreLabel: UILabel!
    @IBOutlet weak var miniProjectsSlider: UISlider!
    
    @IBOutlet weak var homeworkScoreLabel: UILabel!
    @IBOutlet weak var homeworkSlider: UISlider!
    
    @IBOutlet weak var attendanceLabel: UILabel!
    @IBOutlet weak var attendanceSlider: UISlider!
    
    @IBOutlet weak var midTermScoreLabel: UILabel!
    @IBOutlet weak var midtermSlider: UISlider!
    
    @IBOutlet weak var finalExamScoreLabel: UILabel!
    @IBOutlet weak var finalExamSlider: UISlider!
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
   
        
        // Add a Navigation Bar
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 54))
        
        
        let navItem = UINavigationItem(title: "Mobile Programming");
        navBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        navBar.barTintColor = UIColor(displayP3Red: 10.0/255.0, green: 10.0/255.0, blue: 10.0/255.0, alpha: 1.0)
        navBar.isTranslucent = false
        self.view.addSubview(navBar);
        
        navBar.setItems([navItem], animated: false);

        
        //Load label values
        let miniProjMin = miniProjectsSlider.minimumValue
        let miniProjMax = miniProjectsSlider.maximumValue
        miniProjectsScoreLabel.text = String.localizedStringWithFormat("%.f/%.f", miniProjMin, miniProjMax)
        
        let hwMin = homeworkSlider.minimumValue
        let hwMax = homeworkSlider.maximumValue
        homeworkScoreLabel.text = String.localizedStringWithFormat("%.f/%.f", hwMin, hwMax)
        
        let attMin = attendanceSlider.minimumValue
        let attMax = attendanceSlider.maximumValue
        attendanceLabel.text = String.localizedStringWithFormat("%.f/%.f", attMin, attMax)
        
        let midMin = midtermSlider.minimumValue
        let midMax = midtermSlider.maximumValue
        midTermScoreLabel.text = String.localizedStringWithFormat("%.f/%.f", midMin, midMax)
        
        let finalMin = finalExamSlider.minimumValue
        let finalMax = finalExamSlider.maximumValue
        finalExamScoreLabel.text = String.localizedStringWithFormat("%.f/%.f", finalMin, finalMax)
        
        gradeLabel.text = "F";
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sliderChanged(_ sender: Any) {
        
        
        let miniProjValue = miniProjectsSlider.value
        let miniProjMax = miniProjectsSlider.maximumValue
        
        miniProjectsScoreLabel.text = String.localizedStringWithFormat("%.f/%.f", miniProjValue, miniProjMax)
        
        let hwValue = homeworkSlider.value
        let hwMax = homeworkSlider.maximumValue
        
        homeworkScoreLabel.text = String.localizedStringWithFormat("%.f/%.f", hwValue, hwMax)
        
        let attValue = attendanceSlider.value
        let attMax = attendanceSlider.maximumValue
        
        attendanceLabel.text = String.localizedStringWithFormat("%.f/%.f", attValue, attMax)
        
        let midValue = midtermSlider.value
        let midMax = midtermSlider.maximumValue
        
        midTermScoreLabel.text = String.localizedStringWithFormat("%.f/%.f", midValue, midMax)
        
        let finalValue = finalExamSlider.value
        let finalMax = finalExamSlider.maximumValue
        
        finalExamScoreLabel.text = String.localizedStringWithFormat("%.f/%.f", finalValue, finalMax)
        
        let total = miniProjValue + hwValue + attValue + midValue + finalValue
        
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

