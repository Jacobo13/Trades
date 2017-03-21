//
//  LocationAdd.swift
//  Trades
//
//  Created by Programación Daniel on 20/03/17.
//  Copyright © 2017 Jacobo Sacal. All rights reserved.
//

import Foundation
import Foundation
import CoreLocation
import UIKit
import MapKit

extension AddViewController {
    
    func configureLocationAdd() {
        // correla en view did load
        self.locationManager.requestAlwaysAuthorization()
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
    }
}
