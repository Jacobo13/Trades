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

class AddViewController: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var listaDeCategorias = ["Arte", "Calzado", "Cocina", "Deportes", "Ejercicio", "Hogar", "Ofinia", "Ropa", "Tecnologia", "Otros",]

    @IBOutlet weak var name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addGestureToView()
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(_ sender: Any) {
        
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
        var categoriaSeleccionada = listaDeCategorias[pickerView.selectedRow(inComponent: 0)]
    }
}
