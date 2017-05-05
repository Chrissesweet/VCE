//
//  ViewController.swift
//  vce2017
//
//  Created by Christian Elawad on 2017-05-04.
//  Copyright © 2017 Christian Elawad. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController {

    @IBOutlet weak var Map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        var location = CLLocationCoordinate2DMake(56.182850383, 15.591162818)
        
        
        var span = MKCoordinateSpanMake(0.002, 0.002)
        
        var region = MKCoordinateRegion(center: location, span: span)
        
        Map.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "stone"
        annotation.subtitle = "hassans"
        
        Map.addAnnotation(annotation)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



