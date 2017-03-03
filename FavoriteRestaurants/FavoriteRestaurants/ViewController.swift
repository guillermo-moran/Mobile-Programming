//
//  ViewController.swift
//  FavoriteRestaurants
//
//  Created by Guillermo Moran on 2/27/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    var restaurantNames = ["The Huddle", "South Congress Market", "Hunt Hall", "Meadows Coffeehouse", "Doyle Cafe"]
    
    var imageNames = ["seu_food", "fruit", "seu_logo", "jos", "jos"]
    
    var descriptions = ["Always The Same Menu", "Green Chicken", "Undercooked Burgers", "Overpriced Coffee", "Art Students"]
    
    //hide status bar 
    override var prefersStatusBarHidden: Bool {
        return false;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("fuck!")
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
        let tableCell = UITableViewCell(style: .subtitle, reuseIdentifier: "swag")
        
        tableCell.textLabel?.text = restaurantNames[indexPath.row]
        tableCell.accessoryType = .disclosureIndicator
        tableCell.detailTextLabel?.text = descriptions[indexPath.row]
        let index = indexPath.row
        
        tableCell.imageView?.image = UIImage(named: imageNames[index])
        */
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "swag", for: indexPath) as! FoodCell
        
        let index = indexPath.row
        cell.titleLabel!.text = restaurantNames[index]
        cell.descriptionLabel!.text = descriptions[index]
        cell.foodImageView!.image = UIImage(named:imageNames[index])
        
        
        return cell
    }

}

