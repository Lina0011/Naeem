//
//  AddViewController.swift
//  naeem
//
//  Created by Lina on 23/09/1443 AH.
//

import UIKit

class AddViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
  
    
   

    @IBOutlet weak var CatagoryPicker: UIPickerView!
    @IBOutlet weak var amount: UITextField!
    
    var pickerCatagory: [String] = [String]()
    var pickedCatagory: String = ""
    var enteredamount: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.CatagoryPicker.delegate = self
        self.CatagoryPicker.dataSource = self
        
        pickerCatagory = ["FOOD 🍎", "SHOPPING 🛍", "CAR 🚗", "OTHERS ➰"]
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
                tap.cancelsTouchesInView = false
                view.addGestureRecognizer(tap)
        
        amount.keyboardType = UIKeyboardType.numberPad
        enteredamount = amount.text ?? "0"
        print(enteredamount)

        // Do any additional setup after loading the view.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerCatagory[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerCatagory.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedCatagory =  pickerCatagory[row]
    }
 
}
