//
//  BudgetView.swift
//  naeem
//
//  Created by Lina on 17/10/1443 AH.
//

import UIKit

class BudgetView: UIView {
    @IBOutlet var budgetTitle: UILabel!
    @IBOutlet var budgetInfo: UILabel!
    @IBOutlet var remaining: UILabel!
    @IBOutlet var numTransactions: UILabel!
    @IBOutlet var editBtn: UIButton!
    @IBOutlet var budgetBar: UIProgressView!
    var progressValue: Float = 0.0
    var viewModel = BudgetViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyStyle()
    }
    
    

    func confg(with BudgetDetails: Budget ){
        let month = "ابريل"
        let remainings = BudgetDetails.Budget - BudgetDetails.expensis
        progressValue = (BudgetDetails.expensis / BudgetDetails.Budget)
       
        budgetTitle.text = "ميزانية شهر \(month)"
        budgetInfo.text =
"انفقت \(BudgetDetails.expensis) من الميزانية \(BudgetDetails.Budget)"
        remaining.text = "متبقي \(remainings) ريال"
        numTransactions.text = "\(BudgetDetails.TransactionsNum) عمليات"
        self.budgetBar.progress = Float(progressValue)
}
    
    
    func applyStyle() {
        budgetBar.transform = budgetBar.transform.scaledBy(x: 1, y: 5)
        budgetBar.layer.cornerRadius = 5
        budgetBar.layer.masksToBounds = true
    }
    
    
    
    
   
    
    
    
    

}
