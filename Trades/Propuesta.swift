//
//  File.swift
//  Trades
//
//  Created by Jacobo Sacal on 3/23/17.
//  Copyright © 2017 Jacobo Sacal. All rights reserved.
//

import Foundation
import UIKit

class Propuesta : UIViewController {
    
    var userID : String = ""
    
    @IBOutlet weak var tradesProductsLabel: UILabel!
    @IBOutlet weak var TradersCollectionView: UICollectionView!
    @IBOutlet weak var yourCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func sendTrade(_ sender: Any) {
    }
    
    
    
    
    
    
    
}


extension Propuesta : UICollectionViewDelegate, UICollectionViewDataSource {

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
    
}
