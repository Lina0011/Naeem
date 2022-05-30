//
//  AddViewModel.swift
//  naeem
//
//  Created by Lina on 03/10/1443 AH.
//

import Foundation


class AddViewModel {
    
    var didCatagoryChanged = Dynamic<Bool>(value: false)
    var enteredamount: Float =  0.0
    var pickedCatagory: String = "المطاعم"
    var catagoryList : [Catagory] = []
    
    private var CatagoryListData : [String] {
        return catagoryList.compactMap({$0.catagoryName})
    }
    
    func titleOfRows ( rows: Int) -> String{
        CatagoryListData[rows]
    }
    func numberOfRows () -> Int{
        CatagoryListData.count
    }
    
    func didSelect(row: Int){
        pickedCatagory =  CatagoryListData[row]
    }
    
    func addNewCell(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: Date())
        let yourDate = formatter.date(from: myString)
        let myStringDate = formatter.string(from: yourDate!)
        
        let catagory = catagoryList.first(where: {$0.catagoryName == pickedCatagory})
        let transaction = Transaction(
            userID: "2GJhS1w8CoRPv4jyiJDr", catagoryID: catagory?.catagoryID ?? "1",
                                      date: myStringDate,
                                      price: enteredamount ,
                                      storeName: nil, catagory: catagory)
      
        APIManager.shared.addTransaction(transaction: transaction)
    
    }
    
    func load(){
        
        APIManager.shared.getCatagories { [weak self] catagories in
            self?.catagoryList = catagories ?? []
            self?.didCatagoryChanged.value = true
        }
    }
    
}
