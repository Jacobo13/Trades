//
//  AddViewController.swift
//  Trades
//
//  Created by Programación Daniel on 14/03/17.
//  Copyright © 2017 Jacobo Sacal. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import CoreLocation

class AddViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var currentLocation : CLLocationCoordinate2D!
    
    
    @IBOutlet weak var descripcion: UITextView!
    var categoriaSeleccionada = ""
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var loading: UIActivityIndicatorView!

    
    var listaDeCategorias = ["", "Arte", "Calzado", "Cocina", "Deportes", "Ejercicio", "Hogar", "Juegos", "Oficina", "Ropa", "Tecnologia", "Otros",]
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var obscuro: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        addGestureToView()
        pickerView.delegate = self
        pickerView.dataSource = self
        name.delegate = self
        descripcion.delegate = self
        
        nameTextFieldIsEmpty()
        
        configureLocationAdd()
        currentLocation = self.locationManager.location?.coordinate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image = selectedPhoto
        dismiss(animated: true)
        nameTextFieldIsEmpty()
    }
    
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        //imagePickerController.mediaTypes = [kCIAttributeTypeImage]
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    func uploadImageFirebase (data: Data) {
        let productID = UUID().uuidString
        let storageRef = FIRStorage.storage().reference().child(productID)
        let uploadMetadata = FIRStorageMetadata()
        uploadMetadata.contentType = "image/jpeg"
        storageRef.put(data as Data, metadata: uploadMetadata) { (metadata, error) in
            if error != nil {
                //print (error?.localizedDescription!)
            }else {
                print ("SUCCESS here is some metadata \(metadata)")
                storageRef.downloadURL(completion: { (url, error) in
                    if error != nil {
                        print (error?.localizedDescription as Any)
                    }else {
                        self.funcionParaURL(URL: url!, ID : productID)
                    }
                })
            }
        }
        
        
    }
    
    @IBAction func save(_ sender: Any) {
        let data = UIImagePNGRepresentation(photoImageView.image!)
        uploadImageFirebase(data: data!)
        
        saveButton.isEnabled = false
        loading.startAnimating()
        self.view.isUserInteractionEnabled = false
        obscuro.isHidden = false
    }
    
    
    func funcionParaURL (URL : URL, ID : String) {
        let userID = FIRAuth.auth()?.currentUser?.uid
        let post = ["UserID"      : userID                    as AnyObject,
                    "Name"        : name.text                 as AnyObject,
                    "Description" : descripcion.text          as AnyObject,
                    "Image"       : "\(URL)"                  as AnyObject,
                    "Latitude"    : currentLocation.latitude  as AnyObject,
                    "Longitude"   : currentLocation.longitude as AnyObject]
        
        //declarar referencia de la base de datos para saber a donde se va a subir la info
        let databaseRef = FIRDatabase.database().reference(withPath: "Categorias/\(categoriaSeleccionada)")
        //crear un post del diccionario anterior bajo el id del usuario
        databaseRef.child(ID).setValue(post)
        name.text = ""
        descripcion.text = "Descripción"
        photoImageView.image = nil
        let post2 = ID
        let databaseRef2 = FIRDatabase.database().reference(withPath: "Users/\(userID!)/Products")
        databaseRef2.child(post2).setValue(post2)
        loading.stopAnimating()
        self.view.isUserInteractionEnabled = true
        obscuro.isHidden = true
        
    }
}

