//
//  MapViewController.swift
//  Northwest
//
//  Created by Guillermo Moran on 3/22/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager();
    
    @IBOutlet private weak var cityImageView: UIImageView!
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var previewImageView: UIImageView!
    @IBOutlet private weak var destinationTextLabel: UILabel!
    
    var destinationText : String!
    var destinationImage : UIImage!
    var coordinatesArray : [CLLocationCoordinate2D] = []
    var mainRegion : MKCoordinateRegion!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Rounded profile picture image
        self.previewImageView.layer.cornerRadius = self.previewImageView.frame.size.width / 2;
        self.previewImageView.clipsToBounds      = true;
        self.previewImageView.layer.borderWidth  = 3.0
        self.previewImageView.layer.borderColor  = UIColor.white.cgColor
        
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        destinationTextLabel.text = destinationText
        cityImageView.image = destinationImage
        
        var annotations : [MKPointAnnotation] = []
        
        for (_, coordinate) in coordinatesArray.enumerated() {
           
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = destinationText
            annotation.subtitle = "Tourist Attraction"
            
            annotations.append(annotation)
            
        }
        
        mapView.addAnnotations(annotations)
        mapView.setRegion(mainRegion, animated: true)
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        
        self.navigationController!.popViewController(animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
