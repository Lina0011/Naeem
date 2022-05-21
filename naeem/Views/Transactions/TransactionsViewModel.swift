//
//  TransactionsViewModel.swift
//  naeem
//
//  Created by Lina on 07/10/1443 AH.
//

import Foundation
import UIKit

class TransactionsViewModel {
    
    private var TransactionsData : [Transaction] {
        return Transactions
    }
    func numberOfRows ( section: Int) -> Int{
        TransactionsData.count
    }
    
    func cellViewModel (for index: IndexPath)-> TransactionCollectionViewModel {
        TransactionCollectionViewModel(Transactions: TransactionsData[index.row])
    }
    
    
    func addShadow(view: UIView) {
        view.setUpShadow(cornerRadius: 12, shadowColor: UIColor.lightGray.cgColor, shadowOpacity: 0.4)

    }
}
