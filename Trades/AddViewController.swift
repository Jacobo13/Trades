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

class AddViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var categoriaSeleccionada = ""
    @IBOutlet weak var pickerView: UIPickerView!
    
    var listaDeCategorias = ["Arte", "Calzado", "Cocina", "Deportes", "Ejercicio", "Hogar", "Oficina", "Ropa", "Tecnologia", "Otros",]

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var name: UITextField!
    let imagePickerController = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addGestureToView()
        pickerView.delegate = self
        pickerView.dataSource = self
        name.delegate = self
        nameTextFieldIsEmpty()
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
    }
    
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.mediaTypes = [kCIAttributeTypeImage]
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    func uploadImageFirebase (data: NSData) {
        let storageRef = FIRStorage.storage().reference(withPath: "Products")
        let uploadMetadata = FIRStorageMetadata()
        uploadMetadata.contentType = "image/jpeg"
        storageRef.put(data as Data, metadata: uploadMetadata) { (metadata, error) in
            if error != nil {
                //print (error?.localizedDescription!)
            }else {
                print ("SUCESS here is some metadata \(metadata)")
            }
        }
        
    }
    
    @IBAction func save(_ sender: Any) {
        //uploadImageFirebase(data: imagePickerController. as NSData)
        //upload image to storage
        
    }

}

