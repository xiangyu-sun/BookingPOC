//
//  ReturnFlightPageViewController.swift
//  EmiratesBooking
//
//  Created by rafal.manka on 22/07/2018.
//  Copyright © 2018 Emirates Airlines. All rights reserved.
//

import UIKit
import CoreLocation

class ReturnFlightPageViewController : UIViewController {
    
    @IBOutlet weak var fromFieldLayout: UIView!
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var toFieldLayout: UIView!
    @IBOutlet weak var forFieldLayout: UIView!
    
    let airportsViewModel = AirportsViewModel()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        fromFieldLayout.setBorder(radius: 5.0)
        toFieldLayout.setBorder(radius: 5.0)
        forFieldLayout.setBorder(radius: 5.0)
        airportsViewModel.didNearestAirportChange = { airport in
            self.fromTextField.text = airport.name
        }
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
}

extension ReturnFlightPageViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != .authorizedWhenInUse { return }
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        let coordinates: CLLocationCoordinate2D = manager.location!.coordinate
        airportsViewModel.refreshNearestAirports(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}

