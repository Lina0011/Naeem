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
    @IBOutlet var catagoryView: UIView!
    
    var catagoryViewContorller : CatagoryChartViewController?
    var homeViewModel = HomeViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        homeViewModel.didBudgetLoad.bind { [weak self] isTrue in
            if isTrue {
                if let budget = AppData.shared.budgetDetails {
                    self?.ExpensesTable.confg(with: budget)
                }
            }
        }
        
        homeViewModel.didCatagoryChanged.bind { catagories in
            self.catagoryViewContorller?.viewModel.updateCatagory(catagoryArr: catagories)
            self.catagoryViewContorller?.Charts.reloadData()
        }
        
        homeViewModel.addShadow(view: ExpensesTable)
       
        homeViewModel.loadCatgories()
        homeViewModel.loadBudget()
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let viewController = segue.destination as? CatagoryChartViewController {
            self.catagoryViewContorller = viewController
        }
        if let vc = segue.destination as? TransactionsViewController {
            vc.viewModel = .init(rsponder: self.homeViewModel)
        }
            
    }
    
   
    
        
        
    
  
    
}

