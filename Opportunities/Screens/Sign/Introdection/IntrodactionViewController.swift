//
//  IntrodactionViewController.swift
//  Opportunities
//
//  Created by youssef on 12/14/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class IntrodactionViewController: BaseWireFrame<IntrodectionViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func bind(ViewModel: IntrodectionViewModel) {
        
    }
    

    @IBAction func skipBtn(_ sender: Any) {
        
        coordinator.mainNavigator.Navigate(to: .MainTabBar)
        
    }
    

}
