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
    
    var restaurantNames = ["Texas Roadhouse", "Fogo De Chao", "Pluckers", "North",
                           "Home Slice", "Hopdoddy Burger Bar","Frank's", "El Taquito",
                           "Hunt Hall Cafe", "The Huddle", "South Congress Market"]

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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableCell = UITableViewCell(style: .default, reuseIdentifier: "swag")
        
        tableCell.textLabel?.text = restaurantNames[indexPath.row]
        tableCell.imageView?.image = UIImage(named: "Food")
        tableCell.accessoryType = .disclosureIndicator
        
        
        return tableCell
    }

}

