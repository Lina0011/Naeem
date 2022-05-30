//
//  budget.swift
//  naeem
//
//  Created by Lina on 08/10/1443 AH.
//

import Foundation


struct Budget {
    let amount : Float
    let date : String?
}

struct BudgetConfg {
    let budget : Budget
    let expensis : Float
    let numTransactions : Int
    
    var remaining : Float{
        budget.amount - expensis
    }
    
    var progressValue: Float {
        (expensis / budget.amount )
    }
}
    

    
