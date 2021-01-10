//
//  AboutViewController.swift
//  Opportunities
//
//  Created by youssef on 12/10/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class AboutViewController: BaseWireFrame<AboutViewModel> {
    @IBOutlet weak var PhotoCollectionView: UICollectionView!
    
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var containerVideo: UIView!
    
    
    let cellIdentfier = "PhotoCollectionViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupTableView()
        
        // Do any additional setup after loading the view.
    }
    
    override func bind(ViewModel: AboutViewModel) {
        
    }
    
    func SetupTableView(){
        PhotoCollectionView.dataSource = self
        PhotoCollectionView.delegate = self
        
        PhotoCollectionView.register(UINib(nibName: cellIdentfier, bundle: nil), forCellWithReuseIdentifier: cellIdentfier)
        configrationCollectionViewToThreeColum()
    }
    
    @IBAction func playVideo(_ sender: Any) {
    }
    @IBAction func Dismiss(_ sender: Any) {
        
        coordinator.dismiss()
    }
    
    func configrationCollectionViewToThreeColum(){
           PhotoCollectionView.collectionViewLayout = createThreeColumnFlowLayout(in: view)
       }
    
}

extension AboutViewController : UICollectionViewDataSource , UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentfier, for: indexPath) as!
        PhotoCollectionViewCell
        
        return cell
    }
    
    
}


extension AboutViewController: UICollectionViewDelegateFlowLayout {
    
    func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 10
        let minimumItemSpacing: CGFloat = 10
        
        let availableWidth =  width - (padding * 2) - (minimumItemSpacing * 2)
        print(availableWidth)
        let itemWidth = availableWidth / 4
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        print(flowLayout.itemSize)
        return flowLayout
    }
}



