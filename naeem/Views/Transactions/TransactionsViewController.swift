//
//  TransactionsViewController.swift
//  naeem
//
//  Created by Lina on 07/10/1443 AH.
//

import UIKit

class TransactionsViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var boxView: UIView!
    
    @IBOutlet var Transactions: UICollectionView!
    var viewModel = TransactionsViewModel()
    

      
        override func viewDidLoad() {
            super.viewDidLoad()
            Transactions.dataSource = self
            Transactions.delegate = self
            Transactions.collectionViewLayout = UICollectionViewFlowLayout()
            self.view.addSubview(Transactions)
            viewModel.addShadow(view: boxView)
          

        }

        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return viewModel.TransactionsData.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
                let model = viewModel.TransactionsData[indexPath.row]
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Transactions", for: indexPath) as! TransactionCollectionViewCell
                cell.load(with: model)
                return cell
           
            }
        

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return CGSize(width: 320, height: 80)
     
        }

}
