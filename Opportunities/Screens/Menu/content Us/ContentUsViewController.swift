//
//  ContentUsViewController.swift
//  Opportunities
//
//  Created by youssef on 12/10/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ContentUsViewController: BaseWireFrame<ContectUsViewModel> {
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var massagtTv: UITextView!
    
    @IBOutlet weak var activityIndicators: NVActivityIndicatorView!
    @IBOutlet weak var subjectTf: TextField!
    @IBOutlet weak var emailTf: TextField!
    @IBOutlet weak var fullNametf: TextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func bind(ViewModel: ContectUsViewModel) {
        ViewModel.SeccessSendMassageAbsercable.subscribe(onNext: { [weak self] (respond) in
            guard let self = self else{return}
            if respond.value == true {
                self.activityIndicators.stopAnimating()
                guard let massage = respond.msg else {return}
                self.presentAlertOnMainThread(message: massage, buttontitle: "", buttonTitle2: "OK", isoneBtn: true)
            }
            
        }).disposed(by: disposePag)
    }

 
    @IBAction func DismissBtn(_ sender: Any) {
        coordinator.dismiss()
    }
    @IBAction func SendMassageBtn(_ sender: Any) {
        
        guard let email = emailTf.text , !email.isEmpty,let name = fullNametf.text , !name.isEmpty,let subject = subjectTf.text ,!subject.isEmpty, let massage = massagtTv.text ,!massage.isEmpty else {return}
        activityIndicators.startAnimating()
        let paramerters : [String : Any] = [
            "name" : name,
            "email" : email,
            "subject" : subject,
            "content" : massage
        ]
        
        vieeModel.ContectUs(parameters: paramerters)
    }
    
}
