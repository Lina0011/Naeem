//
//  AddViewController.swift
//  naeem
//
//  Created by Lina on 23/09/1443 AH.
//

import UIKit

class AddViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
  
    var addViewModel = AddViewModel()
    
    static var update = false
    
    @IBOutlet weak var amount: UITextField!
    
    
    @IBAction func amount(_ sender: UITextField) {
      
        addViewModel.enteredamount = (amount.text! as NSString).floatValue
    }
    
    @IBOutlet weak var CatagoryPicker: UIPickerView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViewModel.didCatagoryChanged.bind { [weak self] isTrue in
            if isTrue {
                self?.CatagoryPicker.reloadAllComponents()
            }
        }
        
        self.CatagoryPicker.delegate = self
        self.CatagoryPicker.dataSource = self
        
        amount.keyboardType = UIKeyboardType.numberPad
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
                tap.cancelsTouchesInView = false
                view.addGestureRecognizer(tap)
        
       
        
        if addViewModel.catagoryList.count == 0 {
            self.addViewModel.load()

          
    
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return addViewModel.titleOfRows(rows: row)
            
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return addViewModel.numberOfRows()
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        addViewModel.didSelect(row: row)
        
    }
 
    
    @IBAction func add(_ sender: Any) {
       
        addViewModel.addNewCell()
        NotificationCenter.default.post(name: Notification.Name("updateTable"), object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    
   
    
}
