//
//  File.swift
//  Trades
//
//  Created by Jacobo Sacal on 3/23/17.
//  Copyright © 2017 Jacobo Sacal. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import Firebase

class Propuesta : UIViewController {
    
    let userID = FIRAuth.auth()?.currentUser?.uid
    var traderUserID : String = ""
    var traderProducts : [NSDictionary] = []
    var yourProducts : [NSDictionary] = []
    let categorias = ["Arte", "Cocina", "Deportes", "Ejercicio", "Hogar", "Juegos", "Oficina", "Ropa", "Tecnologia", "Otros"]
    var traderList : [String] = []
    var yourList : [String] = []
    @IBOutlet weak var tradesProductsLabel: UILabel!
    @IBOutlet weak var TradersCollectionView: UICollectionView!
    @IBOutlet weak var yourCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        traderProducts = []
        traderList = []
        let databaseRef = FIRDatabase.database().reference()
        for categoria in categorias {
            databaseRef.child("Categorias/\(categoria)").observeSingleEvent(of: .value, with: { (snapshot) in
                
                print("\(snapshot.childrenCount)")
                for producto in snapshot.children.allObjects as! [FIRDataSnapshot] {
                    let key = producto.key
                    let value1 = producto.value as? NSDictionary
                    
                    print(value1!["UserID"] as! String)
                    if value1!["UserID"] as! String == self.traderUserID {
                        self.traderProducts.append(value1!)
                        self.traderList.append(key)
                    }
                    if value1!["UserID"] as! String == self.userID! {
                        self.yourProducts.append(value1!)
                        self.yourList.append(key)
                    }
                    
            
                }
            })
        }
    }
    
    @IBAction func sendTrade(_ sender: Any) {
    }
    
    
    
    
    
    
    
}


//extension Propuesta : UICollectionViewDelegate, UICollectionViewDataSource {

//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return categorias.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CategoriesCollectionViewCell
//        cell.imagen.image = UIImage(named: categorias[indexPath.item])
//        return cell
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.categoria = categorias[indexPath.item]
//        //Hacemos la llamada al servicio segun la elección del usuario
//        performSegue(withIdentifier: "menuToMap", sender: nil)
//    }
    
//}
