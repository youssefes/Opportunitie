//
//  ContentUsViewController.swift
//  Opportunities
//
//  Created by youssef on 12/10/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class ContentUsViewController: BaseWireFrame<ContectUsViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func bind(ViewModel: ContectUsViewModel) {
        
    }

 
    @IBAction func DismissBtn(_ sender: Any) {
        coordinator.dismiss()
    }
    
}
