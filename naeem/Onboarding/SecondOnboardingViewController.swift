//
//  SecondOnboardingViewController.swift
//  naeem
//
//  Created by Lina on 23/10/1443 AH.
//

import UIKit

class SecondOnboardingViewController: UIViewController {

    
    @IBOutlet var EnteredBudget: UITextField!
    
    
    
   
    @IBAction func editingDidEnd(_ sender: Any) {
        let budget = Float(EnteredBudget.text ?? "")
        let userbudget = Budget(userID: "2GJhS1w8CoRPv4jyiJDr", amount: budget ?? 0, date: Date().currentDate())
        APIManager.shared.addBudget(budget: userbudget)
        AppData.shared.userBudget = userbudget
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EnteredBudget.keyboardType = UIKeyboardType.numberPad
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
                tap.cancelsTouchesInView = false
                view.addGestureRecognizer(tap)
        
      
        
    }
    

    

}
