//
//  PaymentViewController.swift
//  Opportunities
//
//  Created by youssef on 12/14/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class PaymentViewController: BaseWireFrame<PaymentViewModel> {
    @IBOutlet weak var knetBtn: UIButton!
    
    @IBOutlet weak var masterCardBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func bind(ViewModel: PaymentViewModel) {
        
    }
    @IBAction func selectedKnet(_ sender: Any) {
        masterCardBtn.backgroundColor = DesignSystem.Colors.Colorclear.color
        masterCardBtn.setImage(#imageLiteral(resourceName: "unselectedCheck"), for: .normal)
        knetBtn.backgroundColor = DesignSystem.Colors.SelectedColor.color
        knetBtn.setImage(#imageLiteral(resourceName: "Vector"), for: .normal)
    }
    
    @IBAction func selectedmasterCard(_ sender: Any) {
        masterCardBtn.backgroundColor = DesignSystem.Colors.SelectedColor.color
        masterCardBtn.setImage(#imageLiteral(resourceName: "Vector"), for: .normal)
        knetBtn.backgroundColor = DesignSystem.Colors.Colorclear.color
         knetBtn.setImage(#imageLiteral(resourceName: "unselectedCheck"), for: .normal)
    }
    @IBAction func dismiss(_ sender: Any) {
        coordinator.dismiss()
    }
    @IBAction func conform(_ sender: Any) {
        coordinator.mainNavigator.Navigate(to: .CompletePayMentViewController)
    }
    
}
