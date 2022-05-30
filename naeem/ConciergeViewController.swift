//
//  ConciergeViewController.swift
//  naeem
//
//  Created by Lina on 23/10/1443 AH.
//

import UIKit

class ConciergeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    override func viewDidAppear(_ animated: Bool) {
  
        if LandscapeManager.shared.isFirstLaunch {
            performSegue(withIdentifier: "toOnboarding", sender: nil)
            LandscapeManager.shared.isFirstLaunch = true
        } else {
            performSegue(withIdentifier: "toMain", sender: nil)
        }
        
        
    }
    
    

}

class Helper {
    
    // to open view controller from another storyboard
    static func openViewController(storyboardID: String, viewControllerID: String, currentVC: UIViewController){
        // create instance from destination storyboard
        let storyboard = UIStoryboard(name: storyboardID, bundle: nil)
        // create instance from new view controller
        let newVC = storyboard.instantiateViewController(withIdentifier: viewControllerID)
        // present the new view controller
        currentVC.present(newVC, animated: true, completion: nil)
    }
}


