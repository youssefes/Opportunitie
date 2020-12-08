//
//  CustomTabBarController.swift
//  Opportunities
//
//  Created by youssef on 12/6/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    enum TabBarItems {
        case Home
        case Active
        case Search
        case Profile
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func setUpTabBarUI() {
        tabBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tabBar.unselectedItemTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }

}
