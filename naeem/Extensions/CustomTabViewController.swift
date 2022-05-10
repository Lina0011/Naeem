//
//  CustomTabViewController.swift
//  naeem
//
//  Created by Lina on 23/09/1443 AH.
//

import UIKit
import STTabbar

class CustomTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let myTabbar = tabBar as? STTabbar {
            myTabbar.centerButtonColor = UIColor(hexString: "#49B1C1")
            myTabbar.unselectedItemColor =  UIColor(hexString: "#C2C2C2")
            myTabbar.centerButtonActionHandler = {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: "addView") as! AddViewController
                self.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
              
            }
            
            
        }
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.selectedIndex = 4
    }
}


