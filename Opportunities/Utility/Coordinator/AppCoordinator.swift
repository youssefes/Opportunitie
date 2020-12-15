//
//  AppCoordinator.swift
//  Opportunities
//
//  Created by youssef on 12/9/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var mainNavigator : MainNavigator {get}
    var navigationController : UINavigationController? {get}
}
class AppCoordinator : Coordinator {
    
    lazy var mainNavigator : MainNavigator = {
          return .init(coordintor: self)
    }()
    
    private lazy var tabBarController : CustomTabBarController = {
        return CustomTabBarController(coordinator: self)
    }()
    
    
    let window : UIWindow
    init(Window : UIWindow = UIWindow()) {
        self.window = Window
       
    }
    
    var navigationController : UINavigationController? {
        if let navigationController = tabBarController.selectedViewController as? UINavigationController {
            return navigationController
        }
        
        return nil
    }
    func start()  {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    var rootViewController : UIViewController {
        
        return tabBarController
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let view = storyBoard.instantiateViewController(identifier: "LanguageToSpeakViewController") as! LanguageToSpeakViewController
//        return view
    }
}
