//
//  SignInViewController.swift
//  Opportunities
//
//  Created by youssef on 12/18/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class SignInViewController: BaseWireFrame<SignInViewModel> {
    @IBOutlet weak var emailTf: TextField!
    
    @IBOutlet weak var password: TextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func bind(ViewModel: SignInViewModel) {
        
    }
    @IBAction func logInBtn(_ sender: Any) {
        signIn()
        navigateTohome()
        
    }
    @IBAction func forgetPasswordBtn(_ sender: Any) {
        let viewc = coordinator.MainStoryBordNavigator.viewController(for: .ForgetPassView)
        present(viewc, animated: true, completion: nil)
    }
    @IBAction func signUpBtn(_ sender: Any) {
        let viewc = coordinator.MainStoryBordNavigator.viewController(for: .SignUpView)
        present(viewc, animated: true, completion: nil)
    }
    
    func signIn(){
        
        guard let email = emailTf.text , !email.isEmpty,let password = password.text , !password.isEmpty else{
            return
        }
        let paramerter : [String : Any] = [
            "email" : email,
            "password" : password
        ]
        vieeModel.Signin(parameters :  paramerter)
        
    }
    
    func  navigateTohome(){
        vieeModel.SeccessSignUp.asObserver().subscribe(onNext: { [weak self](resulte) in
            if resulte.status == 1{
                guard let viewc = self?.coordinator.mainNavigator.viewController(for: .MainTabBar) else  { print("error to navigation")
                    return
                }
                self?.present(viewc, animated: true, completion: nil)
            }else{
                print(resulte)
            }
            
            }, onError: { (error) in
                print(error)
        }).disposed(by: disposePag)
    }
}
