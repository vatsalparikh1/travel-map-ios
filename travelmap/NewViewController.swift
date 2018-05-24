//
//  NewViewController.swift
//  travelmapNewViewController
//
//  Created by Vatsal Parikh on 8/13/17.
//  Copyright © 2017 Vatsal Parikh. All rights reserved.
//

import UIKit

class TravelSetupViewController: UIViewController {
    @IBOutlet var txtTravelSourceOUTLET: UITextField!
    
    @IBOutlet var txtTravelDestinationOUTLET: UITextField!
    @IBOutlet var lblTitleOUTLET: UILabel!
    @IBOutlet var btnSubmitOUTLET: UIButton!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! TravelDetailsViewController
        destinationViewController.travelSource = txtTravelSourceOUTLET.text
        destinationViewController.travelDestination = txtTravelDestinationOUTLET.text
    }
    
    
    
    
    @IBAction func unwindChooseNewTripACTION(usingSegue:UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        
    }
}
