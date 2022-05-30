//
//  HomeViewModel.swift
//  naeem
//
//  Created by Lina on 03/10/1443 AH.
//

import Foundation
import UIKit

class HomeViewModel: TransactionsViewModelResponder

{
    var didCatagoryChanged = Dynamic<[Catagory]>(value: [])
    var mainCatagories : [Catagory] = [] 
    var didBudgetLoad = Dynamic<Bool>(value: false)
    
     var budgetData : Budget?
 
    
    func addShadow(view: UIView) {
        view.setUpShadow(cornerRadius: 12, shadowColor: UIColor.lightGray.cgColor, shadowOpacity: 0.4)
    }
    
    func loadCatgories() {
        
        APIManager.shared.getCatagories { catagory in
            guard let catagory = catagory else {
                return
            }
            self.mainCatagories = catagory
            AppData.shared.mainCatagories = catagory
            self.didCatagoryChanged.value = catagory
        }
    }
    
    func loadBudget() {
        
        APIManager.shared.getBudget {[weak self] budget in
            self?.budgetData = budget
            AppData.shared.userBudget = budget
            self?.loadTransactions()
        }
     
    }
    
    func loadTransactions() {
        
        APIManager.shared.getTransactions { [weak self]transactionsData in
            guard let transactionsData = transactionsData else {
                return
            }
            let sum = transactionsData.compactMap({$0.price}).reduce(0, +)
            let counter = transactionsData.count
            
            AppData.shared.budgetDetails = BudgetConfg(budget: AppData.shared.userBudget!, expensis: sum, numTransactions: counter)
            self?.didBudgetLoad.value = true

        }
      
    }
    
    func didTransactionsCahnged(status: String) {
        loadBudget()
    }
    

}
