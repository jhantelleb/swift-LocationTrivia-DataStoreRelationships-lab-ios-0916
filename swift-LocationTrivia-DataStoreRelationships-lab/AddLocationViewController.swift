//
//  AddLocationViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Jhantelle Belleza on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreLocation

class AddLocationViewController: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate {
    
    //JB: accessibility labels and identifiers changed in the main storyboard
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var latitudeField: UITextField!
    @IBOutlet weak var longitudeField: UITextField!
    @IBOutlet weak var submitOutlet: UIButton!
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    @IBAction func cancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        let location = Location()
        
        guard let name = nameField.text else { return }
        location.name = name
        guard let latitude = latitudeField.text else {return }
        location.latitude = Float(latitude)!
        guard let longitude = longitudeField.text else { return }
        location.longitude = Float(longitude)!
        LocationsDataStore.sharedInstance.locations.append(location)
        print(location)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK
    //Current Location
    @IBAction func currentLocation(_ sender: UIButton) {
        //Core Location
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func viewDidLoad() { //Attempt CLLocation
        super.viewDidLoad()
    }
    
    func locationManager(manager: CLLocationManager!,
                         didUpdateLocations locations: [AnyObject]!)
    {
        self.locationManager.stopUpdatingLocation()
        
        let latestLocation = locations.last
        
        latitudeField.text = String(format: "%.4f",
                               latestLocation!.coordinate.latitude)
        longitudeField.text = String(format: "%.4f",
                                latestLocation!.coordinate.longitude)
        
        print(latitudeField.text, longitudeField.text)
        
//        var distanceBetween: CLLocationDistance =
//            latestLocation.distance(startLocation)
//        
//        distance.text = String(format: "%.2f", distanceBetween)
    }
    
    func locationManager(manager: CLLocationManager!,
                         didFailWithError error: NSError!) {
        
    }
}
