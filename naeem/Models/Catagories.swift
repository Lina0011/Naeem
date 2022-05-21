//
//  Catagories.swift
//  naeem
//
//  Created by Lina on 04/10/1443 AH.
//

import UIKit
import FirebaseCore



struct Catagory {
    let img : String
    let catagoryName : String
    let percentage : Float?
    let total : Float?

}



let Catagories : [Catagory] = [
    
   
    Catagory(img: "", catagoryName: "المواصلات" , percentage: 100.0 , total : 360),
    Catagory(img: "" , catagoryName: "المطاعم", percentage: 30.0 , total : 360),
    Catagory(img: "", catagoryName: "التسوق", percentage: 30.0 , total : 360),
]
