//
//  ForgetPassViewController.swift
//  Opportunities
//
//  Created by youssef on 12/18/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class ForgetPassViewController: BaseWireFrame<ForgetPassViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func bind(ViewModel: ForgetPassViewModel) {
        
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func conformBtn(_ sender: Any) {
        let viewc = coordinator.MainStoryBordNavigator.viewController(for: .RestPassView)
         present(viewc, animated: true, completion: nil)
    }
    
}
