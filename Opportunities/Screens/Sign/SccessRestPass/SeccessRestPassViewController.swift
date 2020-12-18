//
//  SeccessRestPassViewController.swift
//  Opportunities
//
//  Created by youssef on 12/18/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class SeccessRestPassViewController : BaseWireFrame<SeccessRestPassViewModel>  {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func bind(ViewModel: SeccessRestPassViewModel) {
        
    }
   
    @IBAction func loginBtn(_ sender: Any) {
        let viewc = coordinator.MainStoryBordNavigator.viewController(for: .SignInView)
        present(viewc, animated: true, completion: nil)
    }
    
}
