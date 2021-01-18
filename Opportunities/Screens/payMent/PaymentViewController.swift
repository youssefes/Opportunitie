//
//  PaymentViewController.swift
//  Opportunities
//
//  Created by youssef on 12/14/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class PaymentViewController: BaseWireFrame<PaymentViewModel> {
    @IBOutlet weak var knetBtn: UIButton!
    
    @IBOutlet weak var amountToPaylbl: UILabel!
    @IBOutlet weak var masterCardBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bind(ViewModel: PaymentViewModel) {
        ViewModel.errorMassage.subscribe(onNext: { [weak self] (massage) in
            guard let self = self else {return}
            if !massage.isEmpty {
                self.presentAlertOnMainThread(message: massage, buttontitle: "", buttonTitle2: "OK", isoneBtn: true)
            }
            
        }).disposed(by: disposePag)
        
        ViewModel.amountToPay.subscribe(onNext: { [weak self] (amount) in
            guard let self = self else {return}
            self.amountToPaylbl.text = "Pay \(amount) KD with:"
        }).disposed(by: disposePag)
        ViewModel.respondDataObservable.subscribe(onNext: { [weak self]  (respond) in
            guard let self = self else {return}
            if respond.value == true{
                self.coordinator.mainNavigator.Navigate(to: .CompletePayMentViewController)
            }else{
                guard let massage = respond.msg else {return}
                self.presentAlertOnMainThread(message: massage, buttontitle: "", buttonTitle2: "OK", isoneBtn: true)
            }
        }).disposed(by: disposePag)
        
    }
    @IBAction func selectedKnet(_ sender: Any) {
        masterCardBtn.backgroundColor = DesignSystem.Colors.Colorclear.color
        masterCardBtn.setImage(#imageLiteral(resourceName: "unselectedCheck"), for: .normal)
        knetBtn.backgroundColor = DesignSystem.Colors.SelectedColor.color
        knetBtn.setImage(#imageLiteral(resourceName: "Vector"), for: .normal)
    }
    
    @IBAction func selectedmasterCard(_ sender: Any) {
        masterCardBtn.backgroundColor = DesignSystem.Colors.SelectedColor.color
        masterCardBtn.setImage(#imageLiteral(resourceName: "Vector"), for: .normal)
        knetBtn.backgroundColor = DesignSystem.Colors.Colorclear.color
        knetBtn.setImage(#imageLiteral(resourceName: "unselectedCheck"), for: .normal)
    }
    @IBAction func dismiss(_ sender: Any) {
        coordinator.dismiss()
    }
    @IBAction func conform(_ sender: Any) {
        conformSubscribe()
    }
    
    func conformSubscribe() {
        vieeModel.sebsecribeToOppertunites()
    }
    
}
