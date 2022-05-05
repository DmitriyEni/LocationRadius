//
//  ViewController.swift
//  25_LocationRadius_Git
//
//  Created by Dmitriy Eni on 05.05.2022.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let center = CLLocation(latitude: 53.92275995460646, longitude: 27.51099109518638)
    
    
    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            
        }

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
            print("locations = \(locValue.latitude) \(locValue.longitude)")
            locationManager.stopUpdatingLocation()
        
        }

    @IBAction func chekLocationAction(_ sender: Any) {
        guard let locValue: CLLocationCoordinate2D = locationManager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        locationManager.stopUpdatingLocation()
        locationManager.startUpdatingLocation()
        let my = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)

        let distance = my.distance(from: center) / 1000

        if distance <= 2 {
            messageLabel.text = "ты в радиусе"
            
            
        } else {
            messageLabel.text = "ты говно"

        }
    }
    
}

