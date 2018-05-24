//
//  ViewController.swift
//  travelmap
//
//  Created by Vatsal Parikh on 8/13/17.
//  Copyright © 2017 Vatsal Parikh. All rights reserved.
//

import UIKit
import MapKit

class TravelDetailsViewController: UIViewController {
    
    @IBOutlet var segmentedOUTLET: UISegmentedControl!
    
    @IBOutlet var myMapOUTLET: MKMapView!
    
    @IBOutlet var lblInformationOUTLET: UILabel!

    @IBOutlet var btnUnwindOUTLET: UIButton!
    
    var travelSource: String!
    var travelDestination: String!
    var myGeocoder = CLGeocoder()
    var myDistanceKm: Double!
    var myDistanceMiles: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myGeocoder.geocodeAddressString(travelSource, completionHandler: {
            (placemarks, error) in
            
            let sourcePlace = placemarks?.first
            let sourceLocation = sourcePlace?.location
            
            let sourceAnnotation = MKPointAnnotation()
            sourceAnnotation.title = self.travelSource
            
            sourceAnnotation.coordinate = (sourceLocation?.coordinate)!
            
            self.myMapOUTLET.addAnnotation(sourceAnnotation)
            
            self.myGeocoder.geocodeAddressString(self.travelDestination, completionHandler: {
                (placemarks, error) in
                
                let destinationPlace = placemarks?.first
                let destinationLocation = destinationPlace?.location
                
                let destinationAnnotation = MKPointAnnotation ()
                destinationAnnotation.title = self.travelDestination
                destinationAnnotation.coordinate = (destinationLocation?.coordinate)!
                
                let distanceMeters = sourceLocation?.distance(from: destinationLocation!)
                let distanceKm = distanceMeters! / 1000
                let distanceMiles = distanceKm * 0.621
                
                self.myDistanceKm = distanceKm
                self.myDistanceMiles = distanceMiles
                
                if self.segmentedOUTLET.selectedSegmentIndex == 0 {
                    self.lblInformationOUTLET.text = String.init(format: "Distance is %.2f km" , distanceKm)
                }
                else{
                    
                    self.lblInformationOUTLET.text = String.init(format: "Distance is %.2f miles" , distanceMiles)
                    
                }
                
                self.myMapOUTLET.addAnnotation(destinationAnnotation)
            })
        })
    }

    @IBAction func segmentedChangedACTION(_ sender: UISegmentedControl) {
        
        if self.segmentedOUTLET.selectedSegmentIndex == 0 {
            self.lblInformationOUTLET.text = String.init(format: "Distance is %.2f km" , myDistanceKm)
        }
        else{
            
            self.lblInformationOUTLET.text = String.init(format: "Distance is %.2f miles" , myDistanceMiles)
            
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

