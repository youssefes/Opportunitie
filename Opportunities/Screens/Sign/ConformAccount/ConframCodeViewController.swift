//
//  ForgetPassViewController.swift
//  Opportunities
//
//  Created by youssef on 12/18/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ConframCodeViewController: BaseWireFrame<comformViewModel> {
    
    @IBOutlet weak var activatyIndicators: NVActivityIndicatorView!
    @IBOutlet weak var textViewNumber1: UITextField!
    
    @IBOutlet weak var textViewNumber2: UITextField!
    @IBOutlet weak var textViewNumber3: UITextField!
    @IBOutlet weak var textviewNumber4: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetDelget()
        
        // Do any additional setup after loading the view.
    }
    
    func SetDelget(){
        
        textViewNumber1.delegate = self
        textViewNumber2.delegate = self
        textViewNumber3.delegate = self
        textviewNumber4.delegate = self
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func bind(ViewModel: comformViewModel) {
        
    }
    @IBAction func verifyBtn(_ sender: Any) {
        //        guard let text = textViewNumber1.text, text.isEmpty ,let text2 = textViewNumber2.text, text2.isEmpty,let text3 = textViewNumber3.text, text3.isEmpty,let text4 = textviewNumber4.text, text4.isEmpty else {
        //            return
        //        }
        //
        activatyIndicators.startAnimating()
        navigateTo()
        
    }
    
    
    func  navigateTo(){
        sendCode()
        vieeModel.SeccessSignUp.asObserver().subscribe(onNext: { [weak self](resulte) in
            guard let self = self  else {return}
            self.activatyIndicators.stopAnimating()
            if  resulte.value == true{
                let viewc = self.coordinator.MainStoryBordNavigator.viewController(for: .haveAcountView)
                self.present(viewc, animated: true, completion: nil)
            }else{
                self.presentAlertOnMainThread(message: resulte.msg, buttontitle: "", buttonTitle2: "OK", isoneBtn: true)
            }
            
            }, onError: { (error) in
                print(error)
        }).disposed(by: disposePag)
    }
    
    func sendCode(){
        
        guard let number1 = textViewNumber1.text , !number1.isEmpty,let number2 = textViewNumber2.text , !number2.isEmpty,let number3 = textViewNumber3.text , !number3.isEmpty,let number4 = textviewNumber4.text , !number4.isEmpty else {return}
        
        let code = number1 + number2 + number3 + number4
        print(code)
        let paramerter : [String : Any] = [
            "email" : "youssef.esmailelfeky@gmail.com",
            "codeActive" : "123456"
        ]
        vieeModel.sendCode(parameters: paramerter)
    }
    
    
}

extension ConframCodeViewController : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(editChanged(textField:)), for: .editingChanged)
    }
    
    @objc func editChanged(textField : UITextField){
        textField.placeholder = ""
        
        textField.backgroundColor = DesignSystem.Colors.SelectedColor.color
        textField.textColor = DesignSystem.Colors.white.color
        if textField == textViewNumber1 {
            if (textField.text?.count)! == 1 {
                textViewNumber2?.becomeFirstResponder()
            }
        }
        else if textField == textViewNumber2 {
            if (textField.text?.count)! == 1 {
                textViewNumber3.becomeFirstResponder()
            }
        }else{
            if (textField.text?.count)! == 1 {
                textviewNumber4.becomeFirstResponder()
            }
        }
    }
    
}
