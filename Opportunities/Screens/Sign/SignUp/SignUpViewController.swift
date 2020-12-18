//
//  SignUpViewController.swift
//  Opportunities
//
//  Created by youssef on 12/6/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class SignUpViewController: BaseWireFrame<SignUpViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func bind(ViewModel: SignUpViewModel) {
        
    }

    @IBAction func getStartBtn(_ sender: Any) {
        let viewc = coordinator.MainStoryBordNavigator.viewController(for: .ConframCodeView)
        present(viewc, animated: true, completion: nil)
    }
    
}
