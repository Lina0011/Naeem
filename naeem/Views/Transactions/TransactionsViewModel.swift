//
//  TransactionsViewModel.swift
//  naeem
//
//  Created by Lina on 07/10/1443 AH.
//

import Foundation
import UIKit

protocol TransactionsViewModelResponder: AnyObject {
    func didTransactionsCahnged(status:String)
}

class TransactionsViewModel {
 
    
    var didTransactionChanged = Dynamic<Bool>(value: false)
    
    private var transactionsData : [Transaction] = [] 
    func numberOfRows ( section: Int) -> Int{
        transactionsData.count
    }
    
    func cellViewModel (for index: IndexPath)-> TransactionCollectionViewModel {
        TransactionCollectionViewModel(Transactions: transactionsData[index.row])
    }
    
    
    func addShadow(view: UIView) {
        view.setUpShadow(cornerRadius: 12, shadowColor: UIColor.lightGray.cgColor, shadowOpacity: 0.4)

    }
    func loadTransactions() {
        
        APIManager.shared.getTransactions { transactionsData in
            guard let transactionsData = transactionsData else {
                return
            }
            
            self.transactionsData = transactionsData
            Dictionary(grouping: transactionsData , by: {$0.catagoryID})
            
            self.didTransactionChanged.value = true
        }
      
    }
    
    weak var rsponder: TransactionsViewModelResponder?
    
    init(rsponder: TransactionsViewModelResponder){
        self.rsponder = rsponder
        
    }
}
