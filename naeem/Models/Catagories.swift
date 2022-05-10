//
//  Catagories.swift
//  naeem
//
//  Created by Lina on 04/10/1443 AH.
//

import UIKit

struct Catagory {
    let img : String
    let catagoryName : String
    let percentage : Float?
    let total : Float?

}

let Catagories : [Catagory] = [
    Catagory(img: "car", catagoryName: "المواصلات" , percentage: 100.0 , total : 360),
    Catagory(img: "food" , catagoryName: "المطاعم", percentage: 30.0 , total : 360),
    Catagory(img: "shop", catagoryName: "التسوق", percentage: 30.0 , total : 360),
]
