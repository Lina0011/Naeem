//
//  TransactionsViewController.swift
//  naeem
//
//  Created by Lina on 07/10/1443 AH.
//

import UIKit

class TransactionsViewController: UIViewController,
                                  UICollectionViewDataSource,
                                    UICollectionViewDelegate ,
                                  UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var boxView: UIView!
    
    @IBOutlet var Transactions: UICollectionView!
    
    var viewModel: TransactionsViewModel!
    

      
        override func viewDidLoad() {
            super.viewDidLoad()
            viewModel.didTransactionChanged.bind { isItTrue in
                if isItTrue {
                    self.Transactions.reloadData()
                }
            }
            Transactions.dataSource = self
            Transactions.delegate = self
            Transactions.collectionViewLayout = UICollectionViewFlowLayout()
            self.view.addSubview(Transactions)
            viewModel.addShadow(view: boxView)
            viewModel.loadTransactions()
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(self.dataChanged),
                name: Notification.Name("updateTable"),
                object: nil)
        }
    
    @objc private func dataChanged(notification: NSNotification){
        viewModel.loadTransactions()
        viewModel.rsponder?.didTransactionsCahnged(status: "")
    }
    
  
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
  
            return viewModel.numberOfRows(section: section)
  
        }

    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Transactions", for: indexPath) as! TransactionCollectionViewCell
             cell.config(with: viewModel.cellViewModel(for: indexPath))
            return cell
           
            }
        

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return CGSize(width: 320, height: 80)
     
        }

}
