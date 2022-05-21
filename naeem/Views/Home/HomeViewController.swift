//
//  HomeViewController.swift
//  naeem
//
//  Created by Lina on 21/09/1443 AH.
//

import UIKit

class HomeViewController: UIViewController{
    

    @IBOutlet var profileBtn: UIBarButtonItem!
    
    @IBOutlet var ExpensesTable: BudgetView!
    @IBOutlet var lastTransctions: UIView!
    
    var homeViewModel = HomeViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewModel.addShadow(view: ExpensesTable)
        ExpensesTable.confg(with: homeViewModel.BudgetData)
        
        
    }
    
    
   
    
        
        
    
  
    
}

