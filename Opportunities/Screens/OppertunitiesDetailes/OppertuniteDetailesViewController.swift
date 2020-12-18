//
//  OppertuniteDetailesViewController.swift
//  Opportunities
//
//  Created by youssef on 12/9/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class OppertuniteDetailesViewController: BaseWireFrame<OppertuniteDetailesViewModel> {
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var discrription2Lbl: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    
    @IBOutlet weak var minLbl: UILabel!
    @IBOutlet weak var maxLbl: UILabel!
    @IBOutlet weak var discription: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func bind(ViewModel: OppertuniteDetailesViewModel) {
        
    }

    @IBAction func ContunieBtn(_ sender: Any) {
        coordinator.mainNavigator.Navigate(to: .payMent)
    }
    @IBAction func shareBtn(_ sender: Any) {
    }
    
    @IBAction func playBtn(_ sender: Any) {
    }
    @IBAction func backBtn(_ sender: Any) {
        coordinator.dismiss()
    }
    
}
