//
//  ThirdOnbodardingViewModel.swift
//  naeem
//
//  Created by Lina on 27/10/1443 AH.
//

import Foundation

class ThirdOnbodardingViewModel {
    
   var didspendingCatagoriesLoad = Dynamic<Bool>(value: false)
   private var spendingCatagories : [Catagory] = []
    
    func numberOfRows ( section: Int) -> Int{
        spendingCatagories.count
    }
    func cellViewModel (for index: IndexPath)-> SpendingInfoCellViewModel {
        SpendingInfoCellViewModel(catagories: spendingCatagories[index.row])
    }
    
//    func updateCatagory(SpendingArr:[Catagory]){
//        SpendingData = SpendingArr
//    }
    
    func loadCatagories (){
        APIManager.shared.getCatagories { [weak self]catagories in
            self?.spendingCatagories = catagories ?? []
            self?.didspendingCatagoriesLoad.value = true
            
        }
    }
    
}
