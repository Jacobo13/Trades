//
//  CategoriesViewController.swift
//  Trades
//
//  Created by Programación Daniel on 20/03/17.
//  Copyright © 2017 Jacobo Sacal. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import Firebase
import FirebaseDatabase


struct postsStruct {
    let description : String!
    let latitude : String!
    let longitud : String!
    let name : String!
    let userID : String!
}

class CategoriesViewController : UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var currentLocation : CLLocationCoordinate2D!
    var objetos : [NSDictionary] = []
    
    var categoria : String!
    let categorias = ["Arte", "Cocina", "Deportes", "Ejercicio", "Hogar", "Juegos", "Oficina", "Ropa", "Tecnologia", "Arte", "Cocina", "Deportes", "Ejercicio", "Hogar", "Juegos", "Oficina", "Ropa", "Tecnologia"]
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        configureLocation()
        currentLocation = self.locationManager.location?.coordinate

        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        objetos = []
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
 
        
        
        
        let vc = segue.destination as! NewsFeedViewController
        vc.locationManager = self.locationManager
        vc.categoria = self.categoria
        vc.objetos = self.objetos
    }
    
    
}

extension CategoriesViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categorias.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CategoriesCollectionViewCell
        cell.imagen.image = UIImage(named: categorias[indexPath.item])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.categoria = categorias[indexPath.item]
        //Hacemos la llamada al servicio segun la elección del usuario
        performSegue(withIdentifier: "menuToMap", sender: nil)
    }
    
    
    
}
