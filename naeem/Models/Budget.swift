//
//  budget.swift
//  naeem
//
//  Created by Lina on 08/10/1443 AH.
//

import Foundation


struct Budget: Codable {
    let userID : String 
    let amount : Float
    let date : String?
    
    func dictionary(month_year: String) -> [String: Any]? {
        var dictionary_ = self.dictionary
        dictionary_?["month_year"] = month_year
        return dictionary_
    }
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
    

    
