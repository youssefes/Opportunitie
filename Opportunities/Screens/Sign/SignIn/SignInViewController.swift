//
//  SignInViewController.swift
//  Opportunities
//
//  Created by youssef on 12/18/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class SignInViewController: BaseWireFrame<SignInViewModel> {
    
    @IBOutlet weak var activatyIndicator: NVActivityIndicatorView!
    
    @IBOutlet weak var emailTf: TextField!
    @IBOutlet weak var forgetPasswordLbl: UILabel!
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
        
         activatyIndicator.startAnimating()
        let paramerter : [String : Any] = [
            "email" : email,
            "password" : password
        ]
        vieeModel.Signin(parameters :  paramerter)
        
    }
    
    func  navigateTohome(){
        vieeModel.SeccessSignIn.subscribe(onNext: { [weak self](resulte) in
            guard let self = self  else {return}
            self.activatyIndicator.stopAnimating()
            guard let status = resulte.code else {return}
            if status == 200{
                let viewc = self.coordinator.tabBarController
                viewc.modalPresentationStyle = .overFullScreen
                self.present(viewc, animated: true, completion: nil)
            }else{
                guard let massage = resulte.msg else {
                    return
                }
                self.presentAlertOnMainThread(message: massage, buttontitle: "", buttonTitle2: "OK", isoneBtn: true)
                self.forgetPasswordLbl.isHidden = false
            }
           
            
        }).disposed(by: disposePag)
    }
}
