//
//  LocationTest.swift
//  Trades
//
//  Created by Programación Daniel on 20/03/17.
//  Copyright © 2017 Jacobo Sacal. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit
import MapKit

extension CategoriesViewController {
    
    func configureLocation() {
        // correla en view did load
        self.locationManager.requestAlwaysAuthorization()
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
    }
    
    func returnDistance(from : CLLocationCoordinate2D, to : CLLocationCoordinate2D, mapView : MKMapView) -> Double {
        let fromPoint = CLLocation(latitude: from.latitude, longitude: from.longitude)
        let toPoint = CLLocation(latitude: to.latitude, longitude: to.longitude)
        
        let result = toPoint.distance(from: fromPoint)
        
        return result
    }
}
