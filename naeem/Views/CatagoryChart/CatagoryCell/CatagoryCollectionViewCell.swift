//
//  CatagoryCollectionViewCell.swift
//  naeem
//
//  Created by Lina on 04/10/1443 AH.
//

import UIKit

struct CatagoryCollectionViewModel {
   var catagories: Catagory
    
    
    
}
class CatagoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var catagoryImg: UIImageView!
    @IBOutlet var catagorylabel: UILabel!
    @IBOutlet var catagoryPrice: UILabel!
    
    @IBOutlet var progressCircle: CircularProgressView!
    
    func config(with viewModel: CatagoryCollectionViewModel ){
        
        catagoryImg.image = UIImage(imageLiteralResourceName: viewModel.catagories.img)
        catagorylabel.text = viewModel.catagories.catagoryName
        catagoryPrice.text = "\(viewModel.catagories.total ?? 0)"
        progressCircle.progressPrecntage = viewModel.catagories.percentage ?? 0.0
    }
}
