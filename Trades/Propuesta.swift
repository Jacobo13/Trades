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
    
    @IBOutlet weak var obscuro: UIImageView!

    @IBOutlet weak var loading: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loading.startAnimating()
        self.view.isUserInteractionEnabled = false
        obscuro.isHidden = false
        TradersCollectionView.delegate = self
        TradersCollectionView.dataSource = self
        yourCollectionView.delegate = self
        yourCollectionView.dataSource = self

        traderProducts = []
        traderList = []
        let databaseRef = FIRDatabase.database().reference()
        for categoria in categorias {
            databaseRef.child("Categorias/\(categoria)").observeSingleEvent(of: .value, with: { (snapshot) in
                
                
                for producto in snapshot.children.allObjects as! [FIRDataSnapshot] {
                    let key = producto.key
                    let value1 = producto.value as? NSDictionary
                    
                    if value1!["UserID"] as! String == self.traderUserID {
                        self.traderProducts.append(value1!)
                        self.traderList.append(key)
                    }
                    if value1!["UserID"] as! String == self.userID! {
                        self.yourProducts.append(value1!)
                        self.yourList.append(key)
                        
    
                        
                        
                    }
                    
            
                }
                //aca
            })
            if categoria == "Otros" {
               TradersCollectionView.reloadData()
                yourCollectionView.reloadData()
            }
        }

    }
    
    @IBAction func sendTrade(_ sender: Any) {
        
    }
    
    
    
    
    
    
    
}


extension Propuesta : UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return traderProducts.count
        } else {
            return yourProducts.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PropuestaCell
        
        if collectionView.tag == 0 {
            cell.name.text = yourProducts[indexPath.row]["Name"] as? String
            let url = URL(string: "\((yourProducts[indexPath.row]["Image"])!)" )
            let data = NSData(contentsOf: url!)
            cell.imagen.image = UIImage(data: data as! Data)
        } else {
            cell.name.text = traderProducts[indexPath.row]["Name"] as? String
            let url = URL(string: "\((traderProducts[indexPath.row]["Image"])!)" )
            let data = NSData(contentsOf: url!)
            cell.imagen.image = UIImage(data: data as! Data)
        }
        loading.stopAnimating()
        self.view.isUserInteractionEnabled = true
        obscuro.isHidden = true
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showPoint"), object: self, userInfo: ["yourProducts" : yourProducts])
        
        return cell
    }
    
    


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PropuestaCell
        cell.backgroundColor = UIColor.green
        //Hacemos la llamada al servicio segun la elección del usuario
        //performSegue(withIdentifier: "menuToMap", sender: nil)
    }
    
}
