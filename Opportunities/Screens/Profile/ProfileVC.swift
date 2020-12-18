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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func bind(ViewModel: ProfileViewModel) {
        
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func settingBtn(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Profile", bundle: nil)
        let Active = storyBoard.instantiateViewController(identifier: "SettingViewController") as! SettingViewController
        navigationController?.pushViewController(Active, animated: true)
    }
    
    
    @IBAction func TransactionsBtn(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Profile", bundle: nil)
        let Active = storyBoard.instantiateViewController(identifier: "TransactionsViewController") as! TransactionsViewController
        navigationController?.pushViewController(Active, animated: true)
        
    }
}
