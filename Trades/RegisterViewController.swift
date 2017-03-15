//
//  RegisterViewController.swift
//  Trades
//
//  Created by Programación Daniel on 14/03/17.
//  Copyright © 2017 Jacobo Sacal. All rights reserved.
// hola me llamo jacobo 
//aa

import Foundation
import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    //declara textfields y label de error
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addGestureToView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func post() {
        //declaracion de variable que guarda id unica del usuario
        let userID = FIRAuth.auth()?.currentUser?.uid
        //crear diccionario que contenga el nombre y correo para subir datos del usuario a firebase
        let post : [String : AnyObject] = ["Name" : name.text as AnyObject,
                                           "Email" : email.text as AnyObject]
        //declarar referencia de la base de datos para saber a donde se va a subir la info
        let databaseRef = FIRDatabase.database().reference(withPath: "Users")
        //crear un post del diccionario anterior bajo el id del usuario
        databaseRef.child(userID!).setValue(post)
    }
    
    @IBAction func CreateAccount(_ sender: Any) {
        FIRAuth.auth()?.createUser(withEmail: email.text!, password: password.text!, completion: {
            user, error in
            //si existe un error imprime el error en errorLabel
            if error != nil{
                if error!.localizedDescription == "An internal error has occurred, print and inspect the error details for more information." {
                    self.errorLabel.text = "Please enter email."
                    
                } else{
                    self.errorLabel.text = error!.localizedDescription
                }
                
            //si no hay error enviar a la pantalla de login
            }else {
                if self.name.text == nil {
                    self.errorLabel.text = "Please enter name."
                } else {
                    self.errorLabel.isHidden = true
                    self.post()
                    print("Take Me To Home Screen")
                    
                    let usuari = UserService()
                    usuari.storeCredentials()
                    
                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BeginingView")
                    self.present(vc, animated: true, completion: nil)
                    //self.sendEmailVerificationWithCompletion

                }
            }
        })
        
    }
    
    /*func sendEmailVerificationWithCompletion {
     print("a")
     }*/
    
}
    
