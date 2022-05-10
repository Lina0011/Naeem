//
//  AddViewController.swift
//  naeem
//
//  Created by Lina on 23/09/1443 AH.
//

import UIKit

class AddViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
  
    var addViewModel = AddViewModel()
    
    @IBOutlet weak var amount: UITextField!
    
    
    @IBAction func amount(_ sender: UITextField) {
        addViewModel.enteredamount = amount.text ?? "0"
    }
    
    @IBOutlet weak var CatagoryPicker: UIPickerView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.CatagoryPicker.delegate = self
        self.CatagoryPicker.dataSource = self
        
        amount.keyboardType = UIKeyboardType.numberPad
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
                tap.cancelsTouchesInView = false
                view.addGestureRecognizer(tap)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return addViewModel.CatagoryListData[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return addViewModel.CatagoryListData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        addViewModel.pickedCatagory =  addViewModel.CatagoryListData[row]
    }
    @IBAction func close(_ sender: Any) {
        
    }
    
    @IBAction func add(_ sender: Any) {
        
    }
}
