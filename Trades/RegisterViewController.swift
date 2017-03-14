//
//  RegisterViewController.swift
//  Trades
//
//  Created by Programación Daniel on 14/03/17.
//  Copyright © 2017 Jacobo Sacal. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func post() {
        let userID = FIRAuth.auth()?.currentUser?.uid
        let post : [String : AnyObject] = ["Name" : name.text as AnyObject,
                                           "Email" : email.text as AnyObject]
        let databaseRef = FIRDatabase.database().reference(withPath: "Users")
        
        databaseRef.child(userID!).childByAutoId().setValue(post)
    }
    
    @IBAction func CreateAccount(_ sender: Any) {
        FIRAuth.auth()?.createUser(withEmail: email.text!, password: password.text!, completion: {
            user, error in
            if error != nil{
                if error!.localizedDescription == "An internal error has occurred, print and inspect the error details for more information." {
                    self.errorLabel.text = "Please enter password."
                } else{
                    self.errorLabel.text = error!.localizedDescription
                }
            }else {
                self.errorLabel.isHidden = true
                self.post()
                print("Take Me To Home Screen")
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
                self.present(vc, animated: true, completion: nil)
                //self.sendEmailVerificationWithCompletion
            }
        })
        
    }
    
    /*func sendEmailVerificationWithCompletion {
     print("a")
     }*/
    
}
    
