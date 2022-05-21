//
//  AddViewModel.swift
//  naeem
//
//  Created by Lina on 03/10/1443 AH.
//

import Foundation
import Firebase
import FirebaseFirestore
 
class AddViewModel {
    
    var enteredamount: Float =  0.0
    var pickedCatagory: String = "المطاعم"
    var doc: DocumentReference!
    
    private var CatagoryListData : [String] {
        return CatagoryList
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
     
        doc = Firestore.firestore().document("Transaction/extrans")
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: Date())
        let yourDate = formatter.date(from: myString)
        let myStringDate = formatter.string(from: yourDate!)
//        Transaction(title: "غير معروف",catagory: Catagory(img: "car", catagoryName: pickedCatagory, percentage: nil, total: nil), price: enteredamount, date: myStringDate)
//        Transactions.insert(newCell, at:0)
        let newCell: [String: Any] = ["title": "غير معروف" , "catagory" : "jjj" ]
        
        doc.setData(newCell){(error) in
            if error != nil {
                print ("error")
            }else {
                print ("saved")
            }
        }
      
        
  
    }
    
}
