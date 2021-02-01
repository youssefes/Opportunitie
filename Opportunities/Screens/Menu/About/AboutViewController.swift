//
//  AboutViewController.swift
//  Opportunities
//
//  Created by youssef on 12/10/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit
import youtube_ios_player_helper_swift
import NVActivityIndicatorView

class AboutViewController: BaseWireFrame<AboutViewModel>,YTPlayerViewDelegate {
    @IBOutlet weak var PhotoCollectionView: UICollectionView!
    @IBOutlet weak var activaty: NVActivityIndicatorView!
    
    @IBOutlet weak var visionlbl: UILabel!
    @IBOutlet weak var massionlbl: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var containerVideo: YTPlayerView!
    @IBOutlet weak var playbtn: UIButton!
    
    
    let cellIdentfier = "PhotoCollectionViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupTableView()
        vieeModel.ViewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func bind(ViewModel: AboutViewModel) {
        ViewModel.SeccessAbsercable.subscribe(onNext: { [weak self] (respond) in
            guard let self = self else {return}
            if respond.status == true{
                guard let data = respond.data?.about else {
                    return
                }
                self.massionlbl.text = data.mission
                self.visionlbl.text = data.mission
                if data.video.contains("www.youtube.com"){
                    self.activaty.startAnimating()
                    guard let id =  self.getYoutubeId(youtubeUrl: data.video) else {return}
                    self.containerVideo.load(videoId: id)
                }
                
            }
        }).disposed(by: disposePag)
    }
    
    func SetupTableView(){
        PhotoCollectionView.dataSource = self
        PhotoCollectionView.delegate = self
        
        PhotoCollectionView.register(UINib(nibName: cellIdentfier, bundle: nil), forCellWithReuseIdentifier: cellIdentfier)
        configrationCollectionViewToThreeColum()
        containerVideo.delegate = self
    }
    
    @IBAction func playVideo(_ sender: Any) {
        containerVideo.playVideo()
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playbtn.isHidden = false
        activaty.stopAnimating()
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



