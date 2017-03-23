//
//  ProductPage.swift
//  Trades
//
//  Created by Jacobo Sacal on 3/22/17.
//  Copyright © 2017 Jacobo Sacal. All rights reserved.
//

import Foundation
import UIKit

class ProductPage : UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descripcion: UILabel!
    
    
    var numeroDeCell : Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func proponerTrueque(_ sender: Any) {
    }
    
}
