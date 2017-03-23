//
//  ViewController.swift
//  Northwest
//
//  Created by Guillermo Moran on 3/22/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    let VIEW_COLOR = UIColor(red:0.02, green:0.18, blue:0.31, alpha:1.0)
    
    let destinations = ["Austin, TX", "Seattle, WA", "Madrid, Spain", "Buenos Aires, Argentina"]
    let visitors = [1321, 2353, 5493, 3913]
    let colors = [UIColor.green, UIColor.red, UIColor.yellow, UIColor.orange]
    let images = [#imageLiteral(resourceName: "austin"), #imageLiteral(resourceName: "seattle"), #imageLiteral(resourceName: "madrid"), #imageLiteral(resourceName: "buenos_aires")]
    
    //Map Stuff
    var regionsArray = [CLLocationCoordinate2DMake(30.267153 , -97.743061),  //Austin
                        CLLocationCoordinate2DMake(47.606209 , -122.332071), //Seattle
                        CLLocationCoordinate2DMake(40.416775 , -3.703790),   //Madrid
                        CLLocationCoordinate2DMake(-34.603684, -58.381559)]  //Buenos Aires
    
                                                         //Austin
    var attractionsArray : [[CLLocationCoordinate2D]] = [[CLLocationCoordinate2DMake(30.267153 , -97.743061),
                                                          CLLocationCoordinate2DMake(30.320762 , -97.773340),
                                                          CLLocationCoordinate2DMake(30.266962 , -97.772859)],
                                                         
                                                         //Seattle
                                                         [CLLocationCoordinate2DMake(47.620506 , -122.349277),
                                                          CLLocationCoordinate2DMake(47.668249 , -122.350767),
                                                          CLLocationCoordinate2DMake(47.607309 , -122.338133)],
                                                         
                                                         //Madrid
                                                         [CLLocationCoordinate2DMake(40.415511 , -3.707401),
                                                          CLLocationCoordinate2DMake(40.453054 , -3.688344),
                                                          CLLocationCoordinate2DMake(40.413782 , -3.692127)],
                                                         
                                                         //Buenos Aires
                                                         [CLLocationCoordinate2DMake(-34.634496 , -58.363134),
                                                          CLLocationCoordinate2DMake(-34.583989 , -58.393004),
                                                          CLLocationCoordinate2DMake(-34.652075 , -58.440105)]]

    @IBOutlet weak var destinationTable: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        destinationTable.delegate = self;
        destinationTable.dataSource = self;
        
        destinationTable.backgroundColor = VIEW_COLOR
        destinationTable.separatorColor = UIColor.clear
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "destinationVC")
            as! DestinationViewController
        
        let index = indexPath.row
        detailVC.destinationText = destinations[index]
        detailVC.visitors = visitors[index]
        detailVC.destinationImage = images[index]
        
        //Set region
        let coordinate = regionsArray[index]
        detailVC.mainRegion = MKCoordinateRegionMakeWithDistance(coordinate, 20000, 20000)
        detailVC.coordinatesArray = attractionsArray[index]
        
        self.show(detailVC, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return destinations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "destinationCell", for: indexPath) as! DestinationTableCell
        
        let index = indexPath.row
        
        cell.destinationLabel.text = destinations[index]
        cell.visitorsLabel.text = "\(visitors[index]) Visitors"
        cell.coloredOverlayView.backgroundColor = colors[index].withAlphaComponent(0.3)
        cell.cellImage.image = images[index]
        
        return cell
        
    }
}

