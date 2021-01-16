//
//  ForgetPassViewController.swift
//  Opportunities
//
//  Created by youssef on 12/18/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ForgetPassViewController: BaseWireFrame<ForgetPassViewModel> {

    @IBOutlet weak var activatyIndicators: NVActivityIndicatorView!
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
            guard let self = self  else {return}
            self.activatyIndicators.stopAnimating()
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
        activatyIndicators.startAnimating()
           let paramerter : [String : Any] = [
               "email" : "youssef.esmailelfeky@gmail.com",
           ]
           vieeModel.ForgetPassRequest(parameters: paramerter)
       }
    
}
