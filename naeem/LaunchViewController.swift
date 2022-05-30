//
//  LaunchViewController.swift
//  naeem
//
//  Created by Lina on 27/10/1443 AH.
//

import UIKit

class LaunchViewController: UIViewController {
    
    var viewModel = LaunchViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadCatgories()
     
    }
    
}

class LaunchViewModel {
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
