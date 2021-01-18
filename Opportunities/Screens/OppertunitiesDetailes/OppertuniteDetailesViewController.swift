//
//  OppertuniteDetailesViewController.swift
//  Opportunities
//
//  Created by youssef on 12/9/20.
//  Copyright © 2020 youssef. All rights reserved.

import UIKit
import AVFoundation
import AVKit

class OppertuniteDetailesViewController: BaseWireFrame<OppertuniteDetailesViewModel> {
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var discrription2Lbl: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var amountTf: TextField!
    @IBOutlet weak var durationLbl: UILabel!
    
    @IBOutlet weak var timeLeftLbl: UILabel!
    @IBOutlet weak var minLbl: UILabel!
    @IBOutlet weak var maxLbl: UILabel!
    @IBOutlet weak var discription: UILabel!
    
    var urlVideo : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var opertuniteId : Int = 0
    override func bind(ViewModel: OppertuniteDetailesViewModel) {
        ViewModel.viewDidlead()
        ViewModel.OppertuniteDetailesObservable.subscribe(onNext: {[weak self](opertunite) in
            guard let self = self else {return}
            self.minLbl.text = opertunite.minimum
            self.maxLbl.text = opertunite.maximum
            self.discription.text = opertunite.detail.html2String
            self.priceLbl.text = opertunite.total
            self.timeLeftLbl.text = opertunite.timeLeft
            self.durationLbl.text = opertunite.duration
            self.urlVideo = opertunite.videoDeal
            self.opertuniteId = opertunite.id
            }).disposed(by: disposePag)
    }

    @IBAction func ContunieBtn(_ sender: Any) {
        guard let amount = amountTf.text,!amount.isEmpty else {
            self.presentAlertOnMainThread(message: "please enter the amount value", buttontitle: "", buttonTitle2: "Ok", isoneBtn: true)
            return}
        coordinator.mainNavigator.Navigate(to: .payMent(opertuniteId: opertuniteId, amount: amount))
    }
    @IBAction func shareBtn(_ sender: Any) {
    }
    
    @IBAction func playBtn(_ sender: Any) {
        print(urlVideo)
        let videoURL = URL(string: urlVideo)
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
    @IBAction func backBtn(_ sender: Any) {
        coordinator.dismiss()
    }
    
}
