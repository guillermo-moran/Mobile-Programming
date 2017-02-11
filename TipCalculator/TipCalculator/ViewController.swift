//
//  ViewController.swift
//  TipCalculator
//
//  Created by Guillermo Moran on 1/30/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipPercentSegment: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Dismiss Keyboard 
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(ViewController.didTapView))
        self.view.addGestureRecognizer(tapRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //Dismiss Keyboard
    func didTapView(){
        self.view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let allNums = billAmountField.text?.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
        
        if (allNums == "") {
            let alert = UIAlertController(title: "Error", message: "Please enter a bill amount", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            return;
        }
     
       
        
        let billAmountFloat = Float(billAmountField.text!)
        
        var percentage: Float!
        
        
        let index : Int = tipPercentSegment.selectedSegmentIndex
        
        if (index == 0) {
            percentage = 0.15
        }
         else if (index == 1) {
            percentage = 0.18
        }
        else if (index == 2) {
            percentage = 0.20
        }
        
        let totalBill = Float(billAmountFloat! + (billAmountFloat! * percentage))
        
        let billText: String = String.localizedStringWithFormat("$ %.2f", totalBill)
        
        totalLabel.text = billText
        
    }
    

}

