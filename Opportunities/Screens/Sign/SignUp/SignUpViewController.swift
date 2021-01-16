//
//  SignUpViewController.swift
//  Opportunities
//
//  Created by youssef on 12/6/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class SignUpViewController: BaseWireFrame<SignUpViewModel> {
    
    @IBOutlet weak var activatyIndactors: NVActivityIndicatorView!
    var isSelested = false
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var accountNumberTf: TextField!
    @IBOutlet weak var phoneNumberCodeTf: TextField!
    @IBOutlet weak var passwordTf: TextField!
    @IBOutlet weak var conformPassTf: TextField!
    @IBOutlet weak var phoneNumberTf: TextField!
    @IBOutlet weak var fullNameTf: TextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        vieeModel.ViewDidLoad()
        
    }
    override func bind(ViewModel: SignUpViewModel) {
        
        
    }
    @IBAction func accuptOurTeermsBtn(_ sender: UIButton) {
        isSelested.toggle()
        if isSelested{
            sender.setImage(#imageLiteral(resourceName: "Vector"), for: .normal)
            sender.backgroundColor = DesignSystem.Colors.SelectedColor.color
        }else{
            sender.setImage(#imageLiteral(resourceName: "unselectedCheck"), for: .normal)
            sender.backgroundColor = DesignSystem.Colors.white.color
        }
        
    }
    
    @IBAction func getStartBtn(_ sender: Any) {
        signUp()
        navigateToConformCode()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func  navigateToConformCode(){
        vieeModel.SeccessSignUp.asObserver().subscribe(onNext: { [weak self](resulte) in
            guard let self = self  else {return}
            self.activatyIndactors.stopAnimating()
            if  resulte.value == true{
                let viewc = self.coordinator.MainStoryBordNavigator.viewController(for: .ConframCodeView)
                self.present(viewc, animated: true, completion: nil)
            }else{
                self.presentAlertOnMainThread(message: resulte.msg, buttontitle: "", buttonTitle2: "OK", isoneBtn: true)
            }
            
            }, onError: { (error) in
                print(error)
        }).disposed(by: disposePag)
    }
    
    func signUp(){
        
        guard let email = emailTf.text , !email.isEmpty,let password = passwordTf.text , !password.isEmpty,let passwordconform = conformPassTf.text , !passwordconform.isEmpty,let phone = phoneNumberTf.text , !phone.isEmpty,let name = fullNameTf.text , !name.isEmpty
            ,let accountNumber = accountNumberTf.text ,!accountNumber.isEmpty, let codeNumder = phoneNumberCodeTf.text ,!codeNumder.isEmpty else {return}
        if password != passwordconform {
            self.presentAlertOnMainThread(message: "the password and conform Password not match", buttontitle: "", buttonTitle2: "OK", isoneBtn: true)
        }else{
            if isSelested{
                activatyIndactors.startAnimating()
                let paramerter : [String : Any] = [
                    "name" : name,
                    "mobile" : codeNumder + phone,
                    "email" : email,
                    "account_bank" : accountNumber,
                    "password_confirmation" : passwordconform,
                    "password" : password,
                ]
                vieeModel.SignUp(parameters: paramerter)
                
            }else{
                presentAlertOnMainThread(message: "you should check Button to accept our trems", buttontitle: "", buttonTitle2: "OK", isoneBtn: true)
            }
        }
        
        
    }
    
}
