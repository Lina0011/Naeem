//
//  Date.swift
//  naeem
//
//  Created by Lina on 29/10/1443 AH.
//

import Foundation

extension Date{
    
    func toMonthYear(date: String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let formatterPrint = DateFormatter()
        formatterPrint.dateFormat = "yyyy M"
        
        let someDateTime: NSDate? = formatter.date(from: date) as NSDate?
        let resultDate = formatterPrint.string(from: someDateTime! as Date)
        
        return resultDate
    }
    func currentDate () -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: self)
        let yourDate = formatter.date(from: myString)
        let myStringDate = formatter.string(from: yourDate!)
        return myStringDate
    }
    func toMonth(date: String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let formatterPrint = DateFormatter()
        formatterPrint.dateFormat = "MMM"
        
        let someDateTime: NSDate? = formatter.date(from: date) as NSDate?
        let resultDate = formatterPrint.string(from: someDateTime! as Date)
        
        return resultDate
    }
}
