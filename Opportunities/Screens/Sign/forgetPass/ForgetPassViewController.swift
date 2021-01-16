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
        vieeModel.SeccessSignUp.subscribe(onNext: { [weak self](resulte) in
            guard let self = self  else {return}
            self.activatyIndicators.stopAnimating()
            if  resulte.value == true{
                let viewc = self.coordinator.MainStoryBordNavigator.viewController(for: .ConframCodeView)
                self.present(viewc, animated: true, completion: nil)
            }else{
                guard let massage = resulte.msg else {
                    return
                }
                self.presentAlertOnMainThread(message: massage, buttontitle: "", buttonTitle2: "OK", isoneBtn: true)
            }
            
            }, onError: { (error) in
                print(error)
        }).disposed(by: disposePag)
    }
    
       func SendRequest(){
        activatyIndicators.startAnimating()
           let paramerter : [String : Any] = [
               "mobile" : "01063714613",
           ]
           vieeModel.ForgetPassRequest(parameters: paramerter)
       }
    
}
