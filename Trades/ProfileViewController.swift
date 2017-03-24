//
//  ProfileViewController.swift
//  Trades
//
//  Created by Jacobo Sacal on 3/15/17.
//  Copyright © 2017 Jacobo Sacal. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    let userID = FIRAuth.auth()?.currentUser?.uid
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
        
        
        //image.image = UIImage(data: data as! Data)
        nombreLabel.text = item["Name"] as? String
        
        let databaseRef = FIRDatabase.database().reference()
        databaseRef.child("Users/\(userID)").observeSingleEvent(of: .value, with: { (snapshot) in
            print("\(snapshot.childrenCount)")
            let value = snapshot.value as! NSDictionary
            self.nombreLabel.text = value["Name"] as? String
            self.mailLabel.text = value["Email"] as? String
            self.infoUsuario.append(value)
        })
        
        databaseRef.child(cat)
        /*loading.stopAnimating()
        self.view.isUserInteractionEnabled = true
        obscuro.isHidden = true*/
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let value = infoUsuario[0]["Products"] as! NSDictionary
        return value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProfileCell
        
        let url = URL(string: "\(item["Image"]!)" )
        let data = NSData(contentsOf: url!)
        cell.imagen.image =
            
        
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProfileCell
        cell.backgroundColor = UIColor.green
        //Hacemos la llamada al servicio segun la elección del usuario
        //performSegue(withIdentifier: "menuToMap", sender: nil)
    }
    
    
}
