//
//  RestPassViewController.swift
//  Opportunities
//
//  Created by youssef on 12/18/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class RestPassViewController: BaseWireFrame<RestPassViewModel> {
    
    @IBOutlet weak var activatyIndactors: NVActivityIndicatorView!
    @IBOutlet weak var conformNewPass: UITextField!
    
    @IBOutlet weak var newPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func bind(ViewModel: RestPassViewModel) {
        
    }
    @IBAction func contiune(_ sender: Any) {
        SendRequest()
        navigateTo()
    }
    
    func  navigateTo(){
        vieeModel.SeccessSignUp.asObserver().subscribe(onNext: { [weak self](resulte) in
            guard let self = self  else {return}
            self.activatyIndactors.stopAnimating()
            if  resulte.value == true{
                let viewc = self.coordinator.MainStoryBordNavigator.viewController(for: .RestPassView)
                self.present(viewc, animated: true, completion: nil)
            }else{
                self.presentAlertOnMainThread(message: resulte.msg, buttontitle: "", buttonTitle2: "OK", isoneBtn: true)
            }
            
            }, onError: { (error) in
                print(error)
        }).disposed(by: disposePag)
    }
    
    func SendRequest(){
        
        //           guard let email = emailTf.text , !email.isEmpty else {return}
        activatyIndactors.startAnimating()
        
        let paramerter : [String : Any] = [
            "email" : "youssef.esmailelfeky@gmail.com",
            "password" : "123456",
            "password_confirmation":  "123456",
        ]
        vieeModel.ChangeRequest(parameters: paramerter)
    }
    
}
