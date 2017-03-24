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
    
    let databaseRef = FIRDatabase.database().reference()
    let categorias = ["Arte", "Cocina", "Deportes", "Ejercicio", "Hogar", "Juegos", "Oficina", "Ropa", "Tecnologia", "Otros"]
    let userID = FIRAuth.auth()?.currentUser?.uid
    var yourProducts : [NSDictionary] = []
    var yourName : String = ""
    init(){
        for categoria in categorias {
            databaseRef.child("Categorias/\(categoria)").observeSingleEvent(of: .value, with: { (snapshot) in
                
                
                for producto in snapshot.children.allObjects as! [FIRDataSnapshot] {
                    let value1 = producto.value as? NSDictionary
                    
                    if (value1!["UserID"] as! String) == self.userID {
                        self.yourProducts.append(value1!)
                    }
                }
                //aca
            })
            
        }
        databaseRef.child("Users/\(userID!)").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as! NSDictionary
            self.yourName = value["Name"] as! String
            print(self.yourName)
        })
        

    }

}
