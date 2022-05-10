//
//  HomeViewController.swift
//  naeem
//
//  Created by Lina on 21/09/1443 AH.
//

import UIKit

class HomeViewController: UIViewController{
    
    @IBOutlet var budgetTitle: UILabel!
    @IBOutlet var budgetInfo: UILabel!
    @IBOutlet var remaining: UILabel!
    @IBOutlet var numTransactions: UILabel!
    @IBOutlet var editBtn: UIButton!
    @IBOutlet var budgetBar: UIProgressView!
    
    @IBOutlet var profileBtn: UIBarButtonItem!
    
    @IBOutlet var ExpensesTable: UIView!
    @IBOutlet var lastTransctions: UIView!
    
    var homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewModel.addShadow(view: ExpensesTable)
        
        

    }
}

