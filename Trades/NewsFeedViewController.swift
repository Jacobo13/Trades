//
//  NewsFeedViewController.swift
//  Trades
//
//  Created by Programación Daniel on 20/03/17.
//  Copyright © 2017 Jacobo Sacal. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class NewsFeedViewController : UIViewController {
    
    var locationManager = CLLocationManager()
    var categoria : String!
    var currentLocation : CLLocationCoordinate2D!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
