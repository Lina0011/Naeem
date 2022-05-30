//
//  TransactionCollectionViewCell.swift
//  naeem
//
//  Created by Lina on 07/10/1443 AH.
//

import UIKit


class TransactionCollectionViewCell: UICollectionViewCell {
    
 
    var initialLoad = true

    
    @IBOutlet var pic: UIImageView!
    @IBOutlet var transDate: UILabel!
    @IBOutlet var transPrice: UILabel!
    @IBOutlet var transCatagory: UILabel!
    @IBOutlet var transName: UILabel!
     
    
    func config(with viewModel: TransactionCollectionViewModel ){
    
      

       

//        var iconimg = viewModel.Transactions
        var catagoryName = viewModel.Transactions.catagory?.catagoryName
       
        pic.image = UIImage(imageLiteralResourceName: viewModel.Transactions.catagory?.img ?? "foodicon")
        transDate.text = "\(self.reurnDate(date: viewModel.Transactions.date))"
        transPrice.text = "\(viewModel.Transactions.price)"
        transCatagory.text = catagoryName
        transName.text = viewModel.Transactions.storeName ?? "غير معروف"
    }
    
    func reurnDate  ( date: String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let formatterPrint = DateFormatter()
        formatterPrint.dateFormat = "MMM dd"
        
        let someDateTime: NSDate? = formatter.date(from: date) as NSDate?
        let resultDate = formatterPrint.string(from: someDateTime! as Date)
        
        return resultDate
    }
    
   
    
}

