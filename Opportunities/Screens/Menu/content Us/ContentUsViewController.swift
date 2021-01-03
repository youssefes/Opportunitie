//
//  ContentUsViewController.swift
//  Opportunities
//
//  Created by youssef on 12/10/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class ContentUsViewController: BaseWireFrame<ContectUsViewModel> {
    @IBOutlet weak var sendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func bind(ViewModel: ContectUsViewModel) {
        
    }

 
    @IBAction func DismissBtn(_ sender: Any) {
        coordinator.dismiss()
    }
    @IBAction func SendMassageBtn(_ sender: Any) {
    }
    
}
