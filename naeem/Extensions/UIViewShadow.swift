//
//  UIViewShadow.swift
//  naeem
//
//  Created by Lina on 05/10/1443 AH.
//

import Foundation
import UIKit

extension UIView{
    
func setUpShadow(cornerRadius: CGFloat, shadowColor: CGColor, shadowOpacity: Float, shadowRadius: CGFloat = 4){
    self.layer.cornerRadius = cornerRadius
    self.layer.shadowColor = shadowColor
    self.layer.shadowOpacity = shadowOpacity
    self.layer.shadowOffset = CGSize.zero
    self.layer.shadowRadius = shadowRadius
}
    func CircleCrop(){
        self.layer.masksToBounds=false
        self.layer.cornerRadius=self.frame.height/2
        self.clipsToBounds=true
       
    }
  
}
