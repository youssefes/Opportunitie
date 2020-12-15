//
//  CustomTabBarController.swift
//  Opportunities
//
//  Created by youssef on 12/6/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    var Coorinator : Coordinator
    
    init(coordinator : Coordinator) {
        self.Coorinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    enum TabBarItems : CaseIterable {
        case Home
        case Active
        case Search
        case Profile
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBarComponent()
      

    }
    
   private func setUpTabBarComponent(){
        self.viewControllers =  TabBarItems.allCases.map({
            let viewController = viewControllerForTabBarItems($0)
            let navigationController = UINavigationController(rootViewController: viewController)
            return navigationController
            
        })

    }
    
  
    func viewControllerForTabBarItems(_ Item : TabBarItems) -> UIViewController {
        switch Item {
            
        case .Home:
            let view = Coorinator.mainNavigator.viewController(for: .home)
            view.tabBarItem = setUpTabBarItemUI(for: Item)
            return view
        case .Active:
            let view = Coorinator.mainNavigator.viewController(for: .Active)
            view.tabBarItem = setUpTabBarItemUI(for: Item)
            return view
        case .Search:
            let view = Coorinator.mainNavigator.viewController(for: .Search)
            view.tabBarItem = setUpTabBarItemUI(for: Item)
            return view
        case .Profile:
            let view = Coorinator.mainNavigator.viewController(for: .Profile)
            view.tabBarItem = setUpTabBarItemUI(for: Item)
            return view
        }
    }
    func setUpTabBarItemUI(for tabBarItem : TabBarItems) -> UITabBarItem {
        let tab : UITabBarItem
        
        switch tabBarItem {
        case .Home:
            tab = .init(title: "", image: #imageLiteral(resourceName: "Vector-3"), selectedImage: #imageLiteral(resourceName: "Home"))
        case .Active:
              tab = .init(title: "", image: #imageLiteral(resourceName: "Vector-5"), selectedImage: #imageLiteral(resourceName: "Vector-4"))
        case .Search:
            tab = .init(title: "", image: #imageLiteral(resourceName: "Search"), selectedImage: #imageLiteral(resourceName: "Vector-2"))
        case .Profile:
            tab = .init(title: "", image: #imageLiteral(resourceName: "Profile"), selectedImage: #imageLiteral(resourceName: "Vector-1"))
        }
        
        tab.titlePositionAdjustment = .init(horizontal: 0, vertical: 5)
        tab.imageInsets = .init(top: 5, left: 0, bottom: -5, right: 0)
        return tab
    }
}
