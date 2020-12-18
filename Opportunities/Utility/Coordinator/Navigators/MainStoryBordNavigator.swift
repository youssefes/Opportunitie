//
//  MainNavigator.swift
//  Opportunities
//
//  Created by youssef on 12/9/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import UIKit

class MainStoryBordNavigator : Navigator {
   
    var coordinator: Coordinator
    
    enum Destination {
        case LanguageToSpeakViewController
        case IntrodactionView
        case profile
        case SignInView
        case SignUpView
        case ForgetPassView
        case haveAcountView
        case ConframCodeView
        case  SeccessRestPassView
        case RestPassView
      
    }
    required init(coordintor: Coordinator) {
        self.coordinator = coordintor
    }
    
    func viewController(for destination: MainStoryBordNavigator.Destination) -> UIViewController {
        
        switch destination {
        case .LanguageToSpeakViewController:
            let viewModel = LanguageToSpeakeViewModel()
            let viewc = LanguageToSpeakViewController.instantiate(fromAppStoryboard: .Main)
            
            viewc.vieeModel = viewModel
            viewc.coordinator = coordinator
            return viewc
        case .profile:
            let viewModel = ProfileViewModel()
            let viewc = ProfileVC.instantiate(fromAppStoryboard: .Profile)
            viewc.vieeModel = viewModel
            viewc.coordinator = coordinator
            return viewc
        case .IntrodactionView:
            let viewModel = IntrodectionViewModel()
            let viewc = IntrodactionViewController.instantiate(fromAppStoryboard: .Main)
            viewc.vieeModel = viewModel
            viewc.coordinator = coordinator
            return viewc
        case .SignInView:
            let viewModel = SignInViewModel()
            let viewc = SignInViewController.instantiate(fromAppStoryboard: .Main)
            viewc.vieeModel = viewModel
            viewc.coordinator = coordinator
            return viewc
        case .SignUpView:
            let viewModel = SignUpViewModel()
            let viewc = SignUpViewController.instantiate(fromAppStoryboard: .Main)
            viewc.vieeModel = viewModel
            viewc.coordinator = coordinator
            return viewc
        case .ForgetPassView:
            let viewModel = ForgetPassViewModel()
            let viewc = ForgetPassViewController.instantiate(fromAppStoryboard: .Main)
            viewc.vieeModel = viewModel
            viewc.coordinator = coordinator
            return viewc
        case .haveAcountView:
            let viewModel = haveAcountViewModel()
            let viewc = haveAcountViewController.instantiate(fromAppStoryboard: .Main)
            viewc.vieeModel = viewModel
            viewc.coordinator = coordinator
            return viewc
        case .ConframCodeView:
            let viewModel = comformViewModel()
            let viewc = ConframCodeViewController.instantiate(fromAppStoryboard: .Main)
            viewc.vieeModel = viewModel
            viewc.coordinator = coordinator
            return viewc
        case .SeccessRestPassView:
            let viewModel = SeccessRestPassViewModel()
            let viewc = SeccessRestPassViewController.instantiate(fromAppStoryboard: .Main)
            viewc.vieeModel = viewModel
            viewc.coordinator = coordinator
            return viewc
        case .RestPassView:
            let viewModel = RestPassViewModel()
            let viewc = RestPassViewController.instantiate(fromAppStoryboard: .Main)
            viewc.vieeModel = viewModel
            viewc.coordinator = coordinator
            return viewc
        }
    }
    
}
