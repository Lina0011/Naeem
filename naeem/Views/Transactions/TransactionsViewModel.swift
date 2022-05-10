//
//  TransactionsViewModel.swift
//  naeem
//
//  Created by Lina on 07/10/1443 AH.
//

import Foundation
import UIKit

class TransactionsViewModel {
    
    var TransactionsData : [Transaction] {
        return Transactions
    }
    
    func addShadow(view: UIView) {
        view.setUpShadow(cornerRadius: 12, shadowColor: UIColor.lightGray.cgColor, shadowOpacity: 0.4)

    }
}
