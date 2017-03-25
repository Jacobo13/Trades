//
//  PendientesViewController.swift
//  Trades
//
//  Created by Programación Daniel on 24/03/17.
//  Copyright © 2017 Jacobo Sacal. All rights reserved.
//

import Foundation
import UIKit


class PendientesViewController : UIViewController {
    
    var fh = FakeingHelper()
    
    
    @IBOutlet weak var imagenUnoIsaac: UIImageView!
    
    
    @IBOutlet weak var imagenDosIsaac: UIImageView!
    
    
    @IBOutlet weak var imagenUnoJacobo: UIImageView!
    
    
    @IBOutlet weak var imagenDosJacobo: UIImageView!
    
    
    
   
    @IBAction func acceptar(_ sender: Any) {
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            print("hice algo con la acción")
        })
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let acciones : [UIAlertAction] = [okAction, cancelAction]
        customAlert(view: self, message: "El trueque ha sido exitoso", action: acciones)
    }
    
    
    @IBAction func rechasar(_ sender: Any) {
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            print("hice algo con la acción")
        })
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let acciones : [UIAlertAction] = [okAction, cancelAction]
        customAlert(view: self, message: "El trueque ha sido rechazado", action: acciones)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//    }
//    
//    
//    
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        
//    }
    
    
    
    
    
    
}
