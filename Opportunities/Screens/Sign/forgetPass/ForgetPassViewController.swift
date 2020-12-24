//
//  ForgetPassViewController.swift
//  Opportunities
//
//  Created by youssef on 12/18/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class ForgetPassViewController: BaseWireFrame<ForgetPassViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func bind(ViewModel: ForgetPassViewModel) {
        
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func conformBtn(_ sender: Any) {
        SendRequest()
        navigateTo()
        
    }
    
    func  navigateTo(){
           vieeModel.SeccessSignUp.asObserver().subscribe(onNext: { [weak self](resulte) in
            print(resulte)
               if  resulte.value == true{
                guard let viewc = self?.coordinator.MainStoryBordNavigator.viewController(for: .RestPassView) else  { print("error to navigation")
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
           ]
           vieeModel.ForgetPassRequest(parameters: paramerter)
       }
    
}
