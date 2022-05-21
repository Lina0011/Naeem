//
//  CatagoryChartViewController.swift
//  naeem
//
//  Created by Lina on 04/10/1443 AH.
//

import UIKit

class CatagoryChartViewController: UIViewController,
                                   UICollectionViewDataSource,
                                    UICollectionViewDelegate ,
                                   UICollectionViewDelegateFlowLayout {

    @IBOutlet var Charts: UICollectionView!
    
    var viewModel = CatagoryChartViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Charts.dataSource = self
        Charts.delegate = self
        Charts.collectionViewLayout = UICollectionViewFlowLayout()
        self.view.addSubview(Charts)

    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows(section: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatagoryChart", for: indexPath) as! CatagoryCollectionViewCell
             cell.config(with: viewModel.cellViewModel(for: indexPath))
            return cell
       
        }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
   
    return CGSize(width: 100, height: 150)
 
    }

}



