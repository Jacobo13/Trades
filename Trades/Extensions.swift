//
//  Extensions.swift
//  Trades
//
//  Created by Jacobo Sacal on 3/14/17.
//  Copyright © 2017 Jacobo Sacal. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func addGestureToView() {
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

extension AddViewController {
    
    func nameTextFieldIsEmpty() {
        // Disable the Save button if the text field is empty.
        let text = name.text ?? ""
        let text1 = descripcion.text ?? ""
        saveButton.isEnabled = !text.isEmpty && !text1.isEmpty && descripcion.text != "Descripción" && photoImageView.image != nil && categoriaSeleccionada != ""
    }

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        // Disable the Save button while editing.
        if textView.text == "Descripción" {
            textView.text = ""
        }
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        nameTextFieldIsEmpty()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        nameTextFieldIsEmpty()
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
        nameTextFieldIsEmpty()
    }
}
