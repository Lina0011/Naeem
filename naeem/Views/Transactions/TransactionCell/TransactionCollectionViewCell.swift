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
    
    func load(with Transactions: Transaction ){
        
        pic.image = UIImage(imageLiteralResourceName: Transactions.catagory.img)
        transDate.text = Transactions.date
        transPrice.text = Transactions.price
        transCatagory.text = Transactions.catagory.catagoryName
        transName.text = Transactions.title
    }
    
}
