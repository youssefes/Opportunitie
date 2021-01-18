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
    var MainStoryBordNavigator : MainStoryBordNavigator {get}
    var navigationController : UINavigationController? {get}
    var tabBarController: CustomTabBarController { get }
    var isLogIn : Bool {get set}
    var firstTimeOpen : Bool {get set}
    func dismiss()
}
class AppCoordinator : Coordinator {
    
    var firstTimeOpen: Bool = true {
        didSet{
            start()
        }
    }
    
    var isLogIn : Bool = false {
        didSet{
            start()
        }
    }
    lazy var mainNavigator : MainNavigator = {
          return .init(coordintor: self)
    }()
    lazy var MainStoryBordNavigator : MainStoryBordNavigator = {
          return .init(coordintor: self)
    }()
    
    lazy var tabBarController : CustomTabBarController = {
        return CustomTabBarController(coordinator: self)
    }()

    
    let window : UIWindow
    init(Window : UIWindow = UIWindow()) {
        self.window = Window
    }
    
    func dismiss() {
        self.navigationController?.popViewController(animated: true)
    }
    var navigationController : UINavigationController? {
        
        if let navigationController = tabBarController.selectedViewController as? UINavigationController {
            return navigationController
        }else{
            return UINavigationController()
        }
    }
    
    func start()  {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    var rootViewController : UIViewController {
        if firstTimeOpen{
             return self.MainStoryBordNavigator.viewController(for: .LanguageToSpeakViewController)
        }else{
            if isLogIn{
                return tabBarController
            }else{
               return self.MainStoryBordNavigator.viewController(for: .SignInView)
            }
        }
        
        
    }
}
