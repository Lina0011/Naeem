//
//  SpendingInfoCollectionViewCell.swift
//  naeem
//
//  Created by Lina on 27/10/1443 AH.
//

import UIKit

class SpendingInfoCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet var img: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var amountSlider: UISlider!
    @IBOutlet var result: UITextField!
    @IBOutlet var details: UILabel!
    @IBOutlet var backgroundview: UIView!
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
               
        result.text = "\(currentValue)"
    }
    func setSlider() {
        amountSlider.maximumValue = AppData.shared.userBudget?.amount ?? 20000
        amountSlider.setValue(0, animated: true)
        
    }
    
    func config(with viewModel: SpendingInfoCellViewModel  ){
      
        var iconimg = viewModel.catagories.img
        let catagoryname = viewModel.catagories.catagoryName
        img.image = UIImage(imageLiteralResourceName: iconimg)
        title.text = catagoryname
        
     
    }
    
}
