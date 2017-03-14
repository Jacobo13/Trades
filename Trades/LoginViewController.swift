//
//  LoginViewController.swift
//  trade
//
//  Created by Programación Daniel on 08/03/17.
//  Copyright © 2017 Programación Daniel. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var incorrectLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        incorrectLabel.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: Any) {
        login()
    }
    
    func login() {
        
        FIRAuth.auth()?.signIn(withEmail: email.text!, password: password.text!, completion: {
            user, error in
            
            if error != nil {
                self.incorrectLabel.isHidden = false
                
            } else{
                
                
                print("take me to the home screen")
                
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PostScreenViewController")
                self.present(vc, animated: true, completion: nil)
            }
        })
    }
}
