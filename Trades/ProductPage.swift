//
//  ProductPage.swift
//  Trades
//
//  Created by Jacobo Sacal on 3/22/17.
//  Copyright © 2017 Jacobo Sacal. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class ProductPage : UIViewController {
    
    @IBOutlet weak var usuario: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descripcion: UILabel!
    
    var infoUsuario : [NSDictionary] = []
    
    @IBOutlet weak var obscuro: UIImageView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loading.startAnimating()
        self.view.isUserInteractionEnabled = false
        obscuro.isHidden = false

        createThings()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createThings() {
        let item = infoUsuario[0]
        let url = URL(string: "\(item["Image"]!)" )
        let data = NSData(contentsOf: url!)
        image.image = UIImage(data: data as! Data)
        descripcion.text = item["Description"] as? String
        name.text = item["Name"] as? String

        
        let databaseRef = FIRDatabase.database().reference()
        databaseRef.child("Users").observeSingleEvent(of: .value, with: { (snapshot) in
            print("\(snapshot.childrenCount)")
            
            for rest in snapshot.children.allObjects as! [FIRDataSnapshot] {
                let item = self.infoUsuario[0]
                if rest.key == item["UserID"] as! String {
                    let value = rest.value as? NSDictionary
                    self.usuario.text = value!["Name"] as? String
                }
                
                //if rest =
                
                //let distance = self.returnDistance(from: self.currentLocation, toLatitude: value?["Latitude"] as! Double, toLongitude: value?["Longitude"] as! Double)
            }
        })
        loading.stopAnimating()
        self.view.isUserInteractionEnabled = true
        obscuro.isHidden = true
    }
    @IBAction func proponerTrueque(_ sender: Any) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! Propuesta
        vc.userID = self.infoUsuario[0]["UserID"] as! String
    }
    
}
