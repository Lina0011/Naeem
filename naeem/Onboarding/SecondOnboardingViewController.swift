//
//  SecondOnboardingViewController.swift
//  naeem
//
//  Created by Lina on 23/10/1443 AH.
//

import UIKit

class SecondOnboardingViewController: UIViewController {

    
    @IBOutlet var EnteredBudget: UITextField!
    
    
    
   
    @IBAction func textChanged(_ sender: Any) {
        let budget = Float(EnteredBudget.text ?? "")
        
        AppData.shared.userBudget = .init(amount: budget ?? 0, date: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EnteredBudget.keyboardType = UIKeyboardType.numberPad
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
                tap.cancelsTouchesInView = false
                view.addGestureRecognizer(tap)
        
      
        
    }
    

    

}
