//
//  CatagoryCollectionViewCell.swift
//  naeem
//
//  Created by Lina on 04/10/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore


class CatagoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var catagoryImg: UIImageView!
    @IBOutlet var catagorylabel: UILabel!
    @IBOutlet var catagoryPrice: UILabel!
    
    @IBOutlet var progressCircle: CircularProgressView!
    
    var doc : DocumentReference!
    
    func returnIcon (catagory:String, icon:String) -> String{
        var iconimg = icon
        switch catagory{
          case "المواصلات":
            iconimg = "car"
          case "المطاعم":
            iconimg = "food"
          case "التسوق":
            iconimg = "shop"
        default:
            iconimg = "unknown"
        }
      return iconimg
        
    }
    
    func config(with viewModel: CatagoryCollectionViewModel ){
        doc = Firestore.firestore().document("Transaction/extrans")
        doc.getDocument { docSnapshot, error in
            guard let docSnapshot = docSnapshot, docSnapshot.exists else {return}
            let myData = docSnapshot.data()
            let catagory = myData?["catagory"] as? String ?? ""
            let title = myData?["title"] as? String ?? "none"
            self.catagorylabel.text = catagory
            self.catagoryPrice.text = title
        }
        var iconimg = viewModel.catagories.img
        var catagoryname = viewModel.catagories.catagoryName
        
        iconimg = returnIcon (catagory: catagoryname, icon: iconimg)
        catagoryImg.image = UIImage(imageLiteralResourceName: iconimg)
      
        progressCircle.progressPrecntage = viewModel.catagories.percentage ?? 0.0
    }
}
