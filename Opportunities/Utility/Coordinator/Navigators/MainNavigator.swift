//
//  MainNavigator.swift
//  Opportunities
//
//  Created by youssef on 12/9/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import UIKit

class MainNavigator : Navigator {
    
    var coordinator: Coordinator
    
    enum Destination {
        case home
        case Search
        case Active
        case menu
        case Notification
        case Language
        case contectUs
        case About
        case AllOpportunitiesViewController
        case MainTabBar
        case OppertuniteDetailesViewController
        case payMent
        case CompletePayMentViewController
        case InvestmentDetailsViewController
    }
    required init(coordintor: Coordinator) {
        self.coordinator = coordintor
    }
    
    func viewController(for destination: MainNavigator.Destination) -> UIViewController {
        
        switch destination {
        case .home:
            let homeViewModel = HomeViewModel()
            let view = HomeViewController(ViewModel: homeViewModel, coordinator: coordinator)
            return view
        case .Search:
            let viewModel = searchViewModel()
            let view = SearchViewController(ViewModel: viewModel, coordinator: coordinator)
            return view
        case .Active:
            let viewModel = ActiveViewModel()
            let view = ActiveViewController(ViewModel: viewModel, coordinator: coordinator)
            return view
        case .menu :
            let viewModel = MenuViewModel()
            let view = MenuViewController(ViewModel: viewModel, coordinator: coordinator)
            return view
        case .Notification:
            let viewModel = NotificationViewModel()
            let view = NotificationViewController(ViewModel: viewModel, coordinator: coordinator)
            return view
        case .Language:
            let viewModel = LanguageViewModel()
            let view = LangoageViewController(ViewModel: viewModel, coordinator: coordinator)
            return view
        case .contectUs:
            let viewModel = ContectUsViewModel()
            let view = ContentUsViewController(ViewModel: viewModel, coordinator: coordinator)
            return view
        case .About:
            let viewModel = AboutViewModel()
            let view = AboutViewController(ViewModel: viewModel, coordinator: coordinator)
            return view
        case .AllOpportunitiesViewController:
            let viewModel = AllOppertunitesViewModel()
            let view = AllOpportunitiesViewController(ViewModel: viewModel, coordinator: coordinator)
            return view
        case .MainTabBar:
            let view = CustomTabBarController(coordinator: coordinator)
            return view
        case .OppertuniteDetailesViewController:
            let viewModel = OppertuniteDetailesViewModel()
            let view = OppertuniteDetailesViewController(ViewModel: viewModel, coordinator: coordinator)
            return view
        case .payMent:
            let viewModel = PaymentViewModel()
            let view = PaymentViewController(ViewModel: viewModel, coordinator: coordinator)
            return view
        case .CompletePayMentViewController:
            let viewModel = CompletePayMentViewModel()
            let view = CompletePayMentViewController(ViewModel: viewModel, coordinator: coordinator)
            return view
        case .InvestmentDetailsViewController:
            let viewModel = InvestementViewModel()
            let view = InvestmentDetailsViewController(ViewModel: viewModel, coordinator: coordinator)
            return view
        }
    }
    
}
