//
//  haveAcountViewController.swift
//  Opportunities
//
//  Created by youssef on 12/18/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class haveAcountViewController: BaseWireFrame<haveAcountViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func bind(ViewModel: haveAcountViewModel) {
        
    }
    @IBAction func contuneBtn(_ sender: Any) {
        let viewc = coordinator.MainStoryBordNavigator.viewController(for: .SignInView)
        present(viewc, animated: true, completion: nil)
    }
    
}
