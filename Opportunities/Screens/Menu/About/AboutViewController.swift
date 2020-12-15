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
        
        PhotoCollectionView.dataSource = self
        PhotoCollectionView.delegate = self
        
        PhotoCollectionView.register(UINib(nibName: cellIdentfier, bundle: nil), forCellWithReuseIdentifier: cellIdentfier)
        // Do any additional setup after loading the view.
    }
    
    override func bind(ViewModel: AboutViewModel) {
        
    }
    
    @IBAction func playVideo(_ sender: Any) {
    }
    @IBAction func Dismiss(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:100 , height:100 )
    }
}


