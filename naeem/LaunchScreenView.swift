//
//  LaunchScreenView.swift
//  naeem
//
//  Created by Lina on 27/10/1443 AH.
//

import UIKit

class LaunchScreenView: UIView {
    
    var didCatagoryChanged = Dynamic<[Catagory]>(value: [])
    var mainCatagories : [Catagory] = []
    
    
    func loadCatgories() {
        
        APIManager.shared.getCatagories { catagory in
            guard let catagory = catagory else {
                return
            }
            self.mainCatagories = catagory
            AppData.shared.mainCatagories = catagory
            self.didCatagoryChanged.value = catagory
        }
    }
    
}

