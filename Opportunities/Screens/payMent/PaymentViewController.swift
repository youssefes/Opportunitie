//
//  PaymentViewController.swift
//  Opportunities
//
//  Created by youssef on 12/14/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class PaymentViewController: BaseWireFrame<PaymentViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func bind(ViewModel: PaymentViewModel) {
        
    }
    
    @IBAction func dismiss(_ sender: Any) {
        coordinator.dismiss()
    }
    @IBAction func conform(_ sender: Any) {
        coordinator.mainNavigator.Navigate(to: .CompletePayMentViewController)
    }
    
}
