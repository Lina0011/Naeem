//
//  HomeViewModel.swift
//  naeem
//
//  Created by Lina on 03/10/1443 AH.
//

import Foundation
import UIKit

class HomeViewModel{
    
     var BudgetData : Budget {
         return budget
     }
    
    func addShadow(view: UIView) {
        view.setUpShadow(cornerRadius: 12, shadowColor: UIColor.lightGray.cgColor, shadowOpacity: 0.4)
    }

}
