//
//  FirebaseService.swift
//  Trades
//
//  Created by Jacobo Sacal on 3/23/17.
//  Copyright © 2017 Jacobo Sacal. All rights reserved.
//

import Foundation
import UIKit
import Firebase



class FirebaseService {

    var objectos : [NSDictionary] = []
    
    init(){
    let databaseRef = FIRDatabase.database().reference()
    databaseRef.child("Categorias/\(categoria!)").observeSingleEvent(of: .value, with: { (snapshot) in
    print("\(snapshot.childrenCount)")
    for rest in snapshot.children.allObjects as! [FIRDataSnapshot] {
    
    let value = rest.value as? NSDictionary
    print(value!)
    let distance = self.returnDistance(from: self.currentLocation, toLatitude: value?["Latitude"] as! Double, toLongitude: value?["Longitude"] as! Double)
    print(distance)
    if distance <= 30000 {
    let dic = ["UserID"      : value?["UserID"]         as AnyObject,
    "Name"        : value?["Name"]           as AnyObject,
    "Description" : value?["Description"]    as AnyObject,
    "Image"       : value?["Image"]          as AnyObject,
    "Latitude"    : value?["Latitude"]       as AnyObject,
    "Longitude"   : value?["Longitude"]      as AnyObject]
    self.objetos.append(dic as NSDictionary)
    print(self.objetos)
    print(value?["Description"] as! String)
    }
    }
    print(self.objetos)
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showPoints"), object: self, userInfo: ["objects" : self.objetos])
    
    })
    }

}
