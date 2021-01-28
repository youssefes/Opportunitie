//
//  InvestmentDetailsViewController.swift
//  Opportunities
//
//  Created by youssef on 12/13/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit
import Kingfisher
import NVActivityIndicatorView
import youtube_ios_player_helper_swift

class InvestmentDetailsViewController : BaseWireFrame<InvestementViewModel>,YTPlayerViewDelegate {
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var viedoImage: UIImageView!
    @IBOutlet weak var viedoContainer: YTPlayerView!
    @IBOutlet weak var porfitelbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var minLbl: UILabel!
    @IBOutlet weak var timelbl: UILabel!
    @IBOutlet weak var descriptionlbl: UILabel!
    
    @IBOutlet weak var AbuteNAmelbl: UILabel!
    @IBOutlet weak var aboultLbl: UILabel!
    @IBOutlet weak var progressvie: UIProgressView!
    @IBOutlet weak var presntagelbl: UILabel!
    @IBOutlet weak var slodLbl: UILabel!
    @IBOutlet weak var timeLift: UILabel!
    @IBOutlet weak var profilLbl: UILabel!
    @IBOutlet weak var maxLbl: UILabel!
    
    @IBOutlet weak var activaty: NVActivityIndicatorView!
    
    let cellIdentfier = "PhotoCollectionViewCell"
    
    var urlVideo = ""
    @IBOutlet weak var InvestementcollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        
    }
    
    override func bind(ViewModel: InvestementViewModel) {
        let oppertunite = ViewModel.oppertunites
        
        minLbl.text = oppertunite.minimum
        maxLbl.text = oppertunite.maximum
        timelbl.text = oppertunite.duration
        timeLift.text = oppertunite.timeLeft
        aboultLbl.text = oppertunite.detail
        let progressPrasentage = (Int(oppertunite.total ?? "") ?? 0) / (oppertunite.amount ?? 0)
        progressvie.progress = Float(Float(progressPrasentage)/100.0)
        profilLbl.text = "\(progressPrasentage)"
        presntagelbl.text = "\(progressPrasentage) %"
        slodLbl.text = "\(oppertunite.amount)KD sold"
        AbuteNAmelbl.text = "About \(oppertunite.name)"
        
        
        self.urlVideo  = oppertunite.videoDeal
        if self.urlVideo.contains("www.youtube.com"){
            self.activaty.startAnimating()
            guard let id =  self.getYoutubeId(youtubeUrl: self.urlVideo) else {return}
            self.viedoContainer.load(videoId: id)
        }
    }
    
    func registerCell(){
        configrationCollectionViewToThreeColum()
        InvestementcollectionView.dataSource = self
        InvestementcollectionView.delegate = self
        InvestementcollectionView.register(UINib(nibName: cellIdentfier, bundle: nil), forCellWithReuseIdentifier: cellIdentfier)
        viedoContainer.delegate = self
    }
    @IBAction func backBtn(_ sender: Any) {
        coordinator.dismiss()
    }
    
    func configrationCollectionViewToThreeColum(){
        InvestementcollectionView.collectionViewLayout = createThreeColumnFlowLayout(in: containerView)
    }
    
    @IBAction func playBtn(_ sender: Any) {
        viedoContainer.playVideo()
    }
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playBtn.isHidden = false
        viedoImage.isHidden = true
        activaty.stopAnimating()
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
    
    func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 20
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

