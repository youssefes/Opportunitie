//
//  SignInViewController.swift
//  Opportunities
//
//  Created by youssef on 12/18/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class SignInViewController: BaseWireFrame<SignInViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func bind(ViewModel: SignInViewModel) {
        
    }
    @IBAction func logInBtn(_ sender: Any) {
        let MainTab = coordinator.mainNavigator.coordinator.tabBarController
        MainTab.modalPresentationStyle = .overFullScreen
        present(MainTab, animated: true, completion: nil)
    }
    @IBAction func forgetPasswordBtn(_ sender: Any) {
        let viewc = coordinator.MainStoryBordNavigator.viewController(for: .ForgetPassView)
        present(viewc, animated: true, completion: nil)
    }
    @IBAction func signUpBtn(_ sender: Any) {
        let viewc = coordinator.MainStoryBordNavigator.viewController(for: .SignUpView)
         present(viewc, animated: true, completion: nil)
    }
}
