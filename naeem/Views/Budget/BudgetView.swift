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
    
    

    func confg(with budgetDetails: BudgetConfg ){
        
        let month = Date().toMonth(date: Date().currentDate())
  
        budgetTitle.text = "ميزانية شهر \(month)"
        
        budgetInfo.text = "انفقت \(budgetDetails.expensis) من الميزانية \(budgetDetails.budget.amount)"
        
        remaining.text = "متبقي \(budgetDetails.remaining) ريال "
        numTransactions.text = "\(budgetDetails.numTransactions) عمليات"
        self.budgetBar.progress = Float(budgetDetails.progressValue)
}
    
    
    func applyStyle() {
        budgetBar.transform = budgetBar.transform.scaledBy(x: 1, y: 5)
        budgetBar.layer.cornerRadius = 5
        budgetBar.layer.masksToBounds = true
    }
    
    
    
    
   
    
    
    
    

}
