//
//  RestPassViewController.swift
//  Opportunities
//
//  Created by youssef on 12/18/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class RestPassViewController: BaseWireFrame<RestPassViewModel> {
    @IBOutlet weak var conformNewPass: UITextField!
    
    @IBOutlet weak var newPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func bind(ViewModel: RestPassViewModel) {
        
    }
    @IBAction func contiune(_ sender: Any) {
        
        navigateTo()
    }
    
    func  navigateTo(){
        SendRequest()
        
        vieeModel.SeccessSignUp.asObserver().subscribe(onNext: { [weak self](resulte) in
            if  resulte.value == true{
                print(resulte.msg)
                guard let viewc = self?.coordinator.MainStoryBordNavigator.viewController(for: .SeccessRestPassView) else  { print("error to navigation")
                    return
                }
                self?.present(viewc, animated: true, completion: nil)
            }else{
                print(resulte.msg)
            }
            
            }, onError: { (error) in
                print(error)
        }).disposed(by: disposePag)
    }
    
    func SendRequest(){
        
        //           guard let email = emailTf.text , !email.isEmpty else {return}
        
        let paramerter : [String : Any] = [
            "email" : "youssef.esmailelfeky@gmail.com",
            "password" : "123456",
            "password_confirmation":  "123456",
        ]
        vieeModel.ChangeRequest(parameters: paramerter)
    }
    
}
