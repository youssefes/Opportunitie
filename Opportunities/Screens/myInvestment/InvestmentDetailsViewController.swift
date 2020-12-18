//
//  InvestmentDetailsViewController.swift
//  Opportunities
//
//  Created by youssef on 12/13/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class InvestmentDetailsViewController : BaseWireFrame<InvestementViewModel> {

    
    let cellIdentfier = "PhotoCollectionViewCell"
    
    
    @IBOutlet weak var InvestementcollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()
        
    }

    override func bind(ViewModel: InvestementViewModel) {
        
    }

    func registerCell(){
        
        InvestementcollectionView.dataSource = self
        InvestementcollectionView.delegate = self
        InvestementcollectionView.register(UINib(nibName: cellIdentfier, bundle: nil), forCellWithReuseIdentifier: cellIdentfier)
    }
    @IBAction func backBtn(_ sender: Any) {
        coordinator.dismiss()
    }
    
}

extension InvestmentDetailsViewController : UICollectionViewDataSource , UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentfier, for: indexPath) as!
        PhotoCollectionViewCell
        
        return cell
    }


}

extension InvestmentDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:100 , height:100 )
    }
}

