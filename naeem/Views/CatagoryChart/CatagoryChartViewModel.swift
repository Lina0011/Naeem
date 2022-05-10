//
//  CatagoryChartViewModel.swift
//  naeem
//
//  Created by Lina on 07/10/1443 AH.
//

import Foundation


class CatagoryChartViewModel {
    
   private var CatagoryData : [Catagory] {
        return Catagories
    }
    
    func numberOfRows ( section: Int) -> Int{
        CatagoryData.count
    }
    func cellViewModel (for index: IndexPath)-> CatagoryCollectionViewModel {
        CatagoryCollectionViewModel(catagories: CatagoryData[index.row])
    }
    
}
