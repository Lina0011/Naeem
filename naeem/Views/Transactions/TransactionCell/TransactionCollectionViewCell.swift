//
//  TransactionCollectionViewCell.swift
//  naeem
//
//  Created by Lina on 07/10/1443 AH.
//

import UIKit



class TransactionCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var pic: UIImageView!
    @IBOutlet var transDate: UILabel!
    @IBOutlet var transPrice: UILabel!
    @IBOutlet var transCatagory: UILabel!
    @IBOutlet var transName: UILabel!
    
    func config(with viewModel: TransactionCollectionViewModel ){
        var iconimg = viewModel.Transactions.catagory.img
        var catagoryName = viewModel.Transactions.catagory.catagoryName
        iconimg = returnIcon(catagory: catagoryName,icon: iconimg)
        pic.image = UIImage(imageLiteralResourceName: iconimg)
        transDate.text = "\(self.reurnDate(date: viewModel.Transactions.date))"
        transPrice.text = "\(viewModel.Transactions.price)"
        transCatagory.text = catagoryName
        transName.text = viewModel.Transactions.title
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
    
    func returnIcon (catagory:String, icon:String) -> String{
        var iconimg = icon
        switch catagory {
             case "المواصلات":
                 iconimg = "caricon"
             case "المطاعم":
                 iconimg = "foodicon"
             case "السفر والسياحة" :
                 iconimg = "travelicon"
             case "التسوق" :
                 iconimg = "shopicon"
             case "الترفيه":
                 iconimg = "funicon"
             case "الوقود":
                 iconimg = "fuelicon"
             default:
                 iconimg = "unknown"
             }
      return iconimg
        
    }
    
   
    
}

