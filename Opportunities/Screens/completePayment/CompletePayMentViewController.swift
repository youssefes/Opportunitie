//
//  CompletePayMentViewController.swift
//  Opportunities
//
//  Created by youssef on 12/14/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class CompletePayMentViewController: BaseWireFrame<CompletePayMentViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func bind(ViewModel: CompletePayMentViewModel) {
        
    }
    @IBAction func MyInvestement(_ sender: Any) {
        coordinator.mainNavigator.Navigate(to: .Active, With: .push)
    }
}
