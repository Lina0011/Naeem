//
//  APIManager.swift
//  naeem
//
//  Created by Lina on 21/10/1443 AH.
//

import Foundation
import Firebase
import FirebaseFirestore

class APIManager {
    
    
    static var shared = APIManager()
    var db = Firestore.firestore()
    
    func getCatagories(completion: @escaping ([Catagory]?)->Void ){
        db.collection(Constants.FirebaseNames.catagory).getDocuments{ querysnapshot, error in
            if error != nil {
                completion(nil)
            }
            else {
                let catagory = querysnapshot?.documents.compactMap({
                    Catagory(catagoryID: $0.documentID,
                             img: $0.data()["urlImage"] as! String,
                             catagoryName:  $0.data()["catagoryNameAr"] as! String)
                })
                completion(catagory)
            }
        }
    }
    
    
    
    func getCatagory(by id:String ,completion: @escaping (Catagory?)->Void ){
        db.collection(Constants.FirebaseNames.catagory).document(id).getDocument { snapshot, error in
            if error != nil {
                completion(nil)
            }
            else {
                guard let snapshot = snapshot else {
                    completion(nil)
                    return
                }
                let catagory =  Catagory(catagoryID: snapshot.documentID,
                                         img: snapshot.data()?["urlImage"] as! String,
                                         catagoryName:  snapshot.data()?["catagoryNameAr"] as! String)
                completion(catagory)
            }
        }
    }
    
    
    
    func addTransaction (transaction: Transaction) {
        var ref: DocumentReference? = nil
        guard let transaction = transaction.dictionary else {
            return
        }
        ref = db.collection(Constants.FirebaseNames.transactions).addDocument(data: transaction) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    
    
    func getTransactions(completion: @escaping ([Transaction]?)->Void ){
              
        db.collection(Constants.FirebaseNames.transactions).getDocuments { [self] querysnapshot, error in
            if error != nil {
                completion(nil)
            }
            else {
                var transactionsArr: [Transaction] = []
                
                let count = querysnapshot?.documents.count
                
                let transactions = querysnapshot?.documents.compactMap({ item in
        
                    self.getCatagory(by:  item.data()["catagoryID"] as! String, completion: { catagory in
                        transactionsArr.append(Transaction(userID: "2GJhS1w8CoRPv4jyiJDr", catagoryID: item.data()["catagoryID"]  as! String,date:item.data()["date"]  as! String, price:item.data()["price"]  as! Float,storeName:item.data()["storeName"] as? String, catagory: catagory))
                        
                        if count == transactionsArr.count {
                            completion(transactionsArr)
                        }
                    })
                })
            }
        }
    }
    
    func getBudget(completion: @escaping (Budget?)->Void ){
              
        db.collection(Constants.FirebaseNames.budget)
            .whereField("userId", isEqualTo: "2GJhS1w8CoRPv4jyiJDr")
            .whereField("month_year", isEqualTo: Date().toMonthYear(date: Date().currentDate()))
            .getDocuments { [self] querysnapshot, error in
            if error != nil {
                completion(nil)
            }
            else {
                
                guard let querysnapshot = querysnapshot else {
                    completion(nil)
                    return
                }
                let firstbudget = querysnapshot.documents.first
                let budget = Budget(amount:firstbudget?.data()["amount"]  as! Float , date: nil )
                completion(budget)
           
              
                }
            }
        }
    
  
    
}

    


  
    
    
    

    
