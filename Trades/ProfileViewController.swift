//
//  ProfileViewController.swift
//  Trades
//
//  Created by Jacobo Sacal on 3/15/17.
//  Copyright © 2017 Jacobo Sacal. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var infoUsuario : [NSDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cerrarSesion(_ sender: Any) {
        UserService.endSession()
        _ = self.navigationController?.popToRootViewController(animated: true)
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

    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension ProfileViewController : UICollectionViewDataSource, UICollectionViewDelegate {

    
    
}
