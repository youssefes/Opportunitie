//
//  OppertuniteDetailesViewController.swift
//  Opportunities
//
//  Created by youssef on 12/9/20.
//  Copyright © 2020 youssef. All rights reserved.

import UIKit
import youtube_ios_player_helper_swift
import NVActivityIndicatorView
import AVKit
import Kingfisher
class OppertuniteDetailesViewController: BaseWireFrame<OppertuniteDetailesViewModel> , YTPlayerViewDelegate{
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var mainviedocontainer: UIView!
    @IBOutlet weak var viedoContainer: YTPlayerView!
    @IBOutlet weak var containerViewToConinesBtn: UIView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var discrription2Lbl: UILabel!
    @IBOutlet weak var amountTf: TextField!
    @IBOutlet weak var durationLbl: UILabel!
    
    @IBOutlet weak var AbuteNAmelbl: UILabel!
    @IBOutlet weak var pressentagelbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var timeLeftLbl: UILabel!
    @IBOutlet weak var minLbl: UILabel!
    @IBOutlet weak var maxLbl: UILabel!
    @IBOutlet weak var discription: UILabel!
    
    @IBOutlet weak var playVideobtn: UIButton!
    @IBOutlet weak var activaty: NVActivityIndicatorView!
    var opertuniteId : Int = 0
    var urlVideo = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        
         viedoContainer.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        containerViewToConinesBtn.roundCorners(corners: [.topLeft, .topRight], radius: 20)
    }
    
    override func bind(ViewModel: OppertuniteDetailesViewModel) {
        ViewModel.viewDidlead()
        ViewModel.OppertuniteDetailesObservable.subscribe(onNext: {[weak self](opertunite) in
            guard let self = self else {return}
            self.minLbl.text = opertunite.minimum
            self.maxLbl.text = opertunite.maximum
            self.discrription2Lbl.text = opertunite.detail.html2String
            self.priceLbl.text = opertunite.total
            self.timeLeftLbl.text = opertunite.timeLeft
            self.durationLbl.text = opertunite.duration
            self.urlVideo  = opertunite.videoDeal
            self.AbuteNAmelbl.text = "\(NSLocalizedString("About", comment: "")) \(opertunite.name)"
            if self.urlVideo.contains("www.youtube.com"){
                self.activaty.startAnimating()
                guard let id =  self.getYoutubeId(youtubeUrl: self.urlVideo) else {return}
                self.viedoContainer.load(videoId: id)
            }else{
                self.viedoContainer.removeFromSuperview()
                let MianUrlImage = "\(NetworkConstants.baseUrlImages)\(opertunite.brief)"
                guard let url = URL(string: MianUrlImage) else {return}
                let resourseMainImage = ImageResource(downloadURL: url)
                self.videoImage.kf.setImage(with: resourseMainImage)
            }
            self.opertuniteId = opertunite.id
            
            let progressPrasentage = (Int(opertunite.total ) ?? 0) / (opertunite.amount )
            self.progressView.progress = Float(Float(progressPrasentage)/100.0)
            self.amountLbl.text = "\(opertunite.amount)KD \(NSLocalizedString("Sold", comment: ""))"
                   
            self.pressentagelbl.text = "\(progressPrasentage) %"
            }).disposed(by: disposePag)
    }

    @IBAction func ContunieBtn(_ sender: Any) {
        guard let amount = amountTf.text,!amount.isEmpty else {
            self.presentAlertOnMainThread(message: "please add amount", buttontitle: "", buttonTitle2: "Ok", isoneBtn: true)
            return}
        coordinator.mainNavigator.Navigate(to: .payMent(opertuniteId: opertuniteId, amount: amount))
    }
    @IBAction func shareBtn(_ sender: Any) {
    }
    
    @IBAction func backBtn(_ sender: Any) {
        coordinator.dismiss()
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playVideobtn.isHidden = false
        videoImage.isHidden = true
        activaty.stopAnimating()
    }
    
    @IBAction func playVideoBtn(_ sender: UIButton) {
        if self.urlVideo.contains("www.youtube.com"){
            viedoContainer.playVideo()
        }else{
            
            let videoURL = URL(string: urlVideo)
            let player = AVPlayer(url: videoURL!)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            self.present(playerViewController, animated: true) {
                playerViewController.player!.play()
            }
        }
        
    }
    
   
}
