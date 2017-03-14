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
    
    //declara text fields
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var incorrectLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //esconder error hasta que exista
        incorrectLabel.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Llamar boton y ejecutar la validación de login cuando le pique al boton
    @IBAction func login(_ sender: Any) {
        login()
    }
    
    
    func login() {
        
        FIRAuth.auth()?.signIn(withEmail: email.text!, password: password.text!, completion: {
            user, error in
            //si existe un error aparecer label de error
            if error != nil {
                self.incorrectLabel.isHidden = false
            //si no hay error que te lleve a la pantalla de inicio
            } else{
                
                
                print("take me to the home screen")
                
                /*let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PostScreenViewController")
                self.present(vc, animated: true, completion: nil)*/
            }
        })
    }
}
