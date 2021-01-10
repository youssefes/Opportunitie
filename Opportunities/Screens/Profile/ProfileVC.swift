//
//  ProfileVC.swift
//  Opportunities
//
//  Created by youssef on 12/13/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class ProfileVC : BaseWireFrame<ProfileViewModel> {

    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func bind(ViewModel: ProfileViewModel) {
        
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func settingBtn(_ sender: Any) {
        let Active = coordinator.MainStoryBordNavigator.viewController(for: .settingProfile)
        navigationController?.pushViewController(Active, animated: true)
    }
    
    
  
    @IBAction func TransactionsBtn(_ sender: Any) {
       let Active = coordinator.MainStoryBordNavigator.viewController(for: .transaction)
        navigationController?.pushViewController(Active, animated: true)
        
    }
}
