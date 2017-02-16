//
//  ViewController.swift
//  LuckySeven
//
//  Created by Guillermo Moran on 2/15/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var cardImg: UIImageView!
    
    var score:Int = 0

    
    let cardsArray = ["ace_of_clubs","ace_of_diamonds","ace_of_hearts","ace_of_spades",
                      "2_of_clubs","2_of_diamonds","2_of_hearts","2_of_spades",
                      "3_of_clubs","3_of_diamonds","3_of_hearts","3_of_spades",
                      "4_of_clubs","4_of_diamonds","4_of_hearts","4_of_spades",
                      "5_of_clubs","5_of_diamonds","5_of_hearts","5_of_spades",
                      "6_of_clubs","6_of_diamonds","6_of_hearts","6_of_spades",
                      "7_of_clubs","7_of_diamonds","7_of_hearts","7_of_spades",
                      "8_of_clubs","8_of_diamonds","8_of_hearts","8_of_spades",
                      "9_of_clubs","9_of_diamonds","9_of_hearts","9_of_spades",
                      "10_of_clubs","10_of_diamonds","10_of_hearts","10_of_spades",
                      "jack_of_clubs","jack_of_diamonds","jack_of_hearts","jack_of_spades",
                      "queen_of_clubs","queen_of_diamonds","queen_of_hearts","queen_of_spades",
                      "king_of_clubs","king_of_diamonds","king_of_hearts","king_of_spades"]
    
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

    @IBAction func drawAction(_ sender: Any) {
        
        
        let randNum : Int = Int(arc4random_uniform(52))
        
        cardImg.image = UIImage(named: cardsArray[randNum])
        
        
        //if (randNum % 4 == 0) {
            //is a club 
        //    score += 1
        //}
        
        if (cardsArray[randNum].hasPrefix("7")) {
            score += 1
        }
        
        scoreLabel.text = String(score)
        
    }

}

