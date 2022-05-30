//
//  AddBudgetViewController.swift
//  naeem
//
//  Created by Lina on 23/10/1443 AH.
//

import UIKit

class ThirdOnboardingViewController: UIViewController,
                                        UICollectionViewDataSource,
                                     UICollectionViewDelegate ,
                                    UICollectionViewDelegateFlowLayout{
    
    var viewModel = ThirdOnbodardingViewModel()
    
    
   
    @IBOutlet var spendingInfo: UICollectionView!
    
    override func viewDidLoad() {
        
        viewModel.didspendingCatagoriesLoad.bind { [weak self] isTrue in
            if isTrue {
                self?.spendingInfo.reloadData()
            }
        }
        
        super.viewDidLoad()
        spendingInfo.dataSource = self
        spendingInfo.delegate = self
        spendingInfo.collectionViewLayout = UICollectionViewFlowLayout()
        viewModel.loadCatagories()
    
    }
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows(section: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpendInfo", for: indexPath) as! SpendingInfoCollectionViewCell
             cell.setSlider()
             cell.config(with: viewModel.cellViewModel(for: indexPath))
            return cell
       
        }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
   
    return CGSize(width: 364, height: 103)
 
    }

    



}
