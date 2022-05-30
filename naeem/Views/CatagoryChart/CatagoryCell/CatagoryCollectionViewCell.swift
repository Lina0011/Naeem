//
//  CatagoryCollectionViewCell.swift
//  naeem
//
//  Created by Lina on 04/10/1443 AH.
//

import UIKit



class CatagoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var catagoryImg: UIImageView!
    @IBOutlet var catagorylabel: UILabel!
    @IBOutlet var catagoryPrice: UILabel!
    
    @IBOutlet var progressCircle: CircularProgressView!
    
    func config(with viewModel: CatagoryCollectionViewModel ){
      
        var iconimg = viewModel.catagories.img
        let catagoryname = viewModel.catagories.catagoryName
        
//        iconimg = returnIcon (catagory: catagoryname, icon: iconimg)
        catagoryImg.image = UIImage(imageLiteralResourceName: iconimg)
        catagorylabel.text = catagoryname
     
    }
}
