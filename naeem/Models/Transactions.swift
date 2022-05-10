//
//  Transactions.swift
//  naeem
//
//  Created by Lina on 07/10/1443 AH.
//

import Foundation


struct Transaction {
    let title : String
    let catagory : Catagory
    let price : String
    let date : String

}

let Transactions : [Transaction] = [
    Transaction(title: "اسواق بنده", catagory: Catagory(img: "foodicon", catagoryName: "المطاعم" , percentage: nil , total : nil), price: "240", date: "يونيو 28"),
    Transaction(title: "هيلتون قاردن", catagory: Catagory(img: "travelicon", catagoryName: "السفر والسياحة" , percentage: nil , total : nil), price: "240", date: "يونيو 28"),
    Transaction(title: "يلو لتأجير السيارات", catagory: Catagory(img:"caricon", catagoryName: "المواصلات" , percentage: nil , total : nil), price: "240", date: "يونيو 28"),
    Transaction(title: "يلو لتأجير السيارات", catagory: Catagory(img: "shopicon", catagoryName: "المواصلات" , percentage: nil , total : nil), price: "240", date: "يونيو 28")
    
    
]



