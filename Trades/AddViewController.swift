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
    
    var listaDeCategorias = ["Arte", "Calzado", "Cocina", "Deportes", "Ejercicio", "Hogar", "Ofinia", "Ropa", "Tecnologia", "Otros",]

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var RatingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addGestureToView()
        pickerView.delegate = self
        pickerView.dataSource = self
        name.delegate = self
        
        checkValidMealName()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func checkValidMealName() {
        // Disable the Save button if the text field is empty.
        let text = name.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidMealName()
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        name.resignFirstResponder()
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

    
    
    @IBAction func save(_ sender: Any) {
        print("a")
        //upload image to storage
        //photoimageview.image
    }

}

extension AddViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listaDeCategorias[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listaDeCategorias.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(listaDeCategorias[pickerView.selectedRow(inComponent: 0)])
        categoriaSeleccionada = listaDeCategorias[pickerView.selectedRow(inComponent: 0)]
    }
}
