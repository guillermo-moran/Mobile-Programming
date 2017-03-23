//
//  DestinationViewController.swift
//  Northwest
//
//  Created by Guillermo Moran on 3/22/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DestinationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var destinationImageView: UIImageView!
    @IBOutlet private weak var destinationLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet weak var hotelImageView: UIImageView!
    
    @IBOutlet weak var blurredView: UIView!
    @IBOutlet weak var reviewTable: UITableView!
    @IBOutlet weak var mapTableView: UITableView!
    
    //Map Stuff 
    var coordinatesArray : [CLLocationCoordinate2D] = []
    var mainRegion : MKCoordinateRegion!
    
    let reviewers = ["Donald Trump", "Barack Obama"]
    let reviewerPictures = [#imageLiteral(resourceName: "trump"), #imageLiteral(resourceName: "obama")]
    let reviews = [
        "Really dumb. This city begged my people for a job. Turned them down twice and then went hostile. Major losers, zero credibility!",
                   
        "Had a great time with my family. Very well recieved by the president of the country. Fantastic food!"]
    
    let stars = 1
    
    //let VIEW_COLOR = UIColor(red:0.02, green:0.18, blue:0.31, alpha:1.0)

    let VIEW_COLOR = UIColor(red:0.22, green:0.22, blue:0.22, alpha:1.0)

    
    var destinationImage : UIImage!
    var destinationText : String!
    var visitors : Int = 0
    
    override func viewWillDisappear(_ animated: Bool) {
        self.destinationImageView.isHidden = true;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        destinationImageView.isHidden = false
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //review Table
        reviewTable.delegate = self
        reviewTable.dataSource = self
        reviewTable.backgroundColor = UIColor.clear
        
        //map button table
        mapTableView.delegate = self
        mapTableView.dataSource = self
        mapTableView.backgroundColor = UIColor.clear
        mapTableView.isScrollEnabled = false;
        mapTableView.separatorColor = UIColor.clear
        
        //Blurred View
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurredView.addSubview(blurEffectView)
        
        blurredView.sendSubview(toBack: blurEffectView)
        
        //Rounded profile picture image
        self.hotelImageView.layer.cornerRadius = self.hotelImageView.frame.size.width / 2;
        self.hotelImageView.clipsToBounds      = true;
        self.hotelImageView.layer.borderWidth  = 3.0
        self.hotelImageView.layer.borderColor  = UIColor.white.cgColor
        
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        //self.navigationController?.navigationBar.tintColor = UIColor.white
        //self.navigationController?.navigationBar.barTintColor = UIColor.black.withAlphaComponent(0.0)

        self.navigationController?.navigationBar.alpha = 0.7

        destinationImageView.image = destinationImage
        destinationLabel.text = destinationText
        visitorsLabel.text = "\(visitors) Visitors"
        
        self.view.backgroundColor = VIEW_COLOR

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
        
        self.navigationController!.popViewController(animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == reviewTable) {
            return reviewers.count
        }
        else {
            return 1; // Only one map button
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView == reviewTable) {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath) as! ReviewTableCell
            
            let index = indexPath.row
            
            cell.backgroundColor = UIColor.clear
            
            cell.reviewerImageView.image = reviewerPictures[index]
            cell.reviewerNameLabel.text = reviewers[index]
            cell.reviewTextView.text = reviews[index]
            
            return cell
        }
        else { // Map Button
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "mapCell")
            
            cell.imageView?.image = #imageLiteral(resourceName: "map")
            cell.textLabel?.text = "Map"
            cell.detailTextLabel?.text = "View Attractions on Map"
            
            cell.textLabel?.textColor = UIColor.white
            cell.detailTextLabel?.textColor = UIColor.white
            
            cell.backgroundColor = UIColor.clear
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (tableView == mapTableView) {
            
            let mapVC = self.storyboard?.instantiateViewController(withIdentifier: "mapVC")
                as! MapViewController
            
            mapVC.mainRegion = mainRegion
            mapVC.coordinatesArray = coordinatesArray
            mapVC.destinationImage = destinationImage
            mapVC.destinationText = destinationText
            
            self.show(mapVC, sender: nil)
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
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
