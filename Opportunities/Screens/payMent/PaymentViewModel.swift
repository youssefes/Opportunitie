//
//  PaymentViewModel.swift
//  Opportunities
//
//  Created by youssef on 12/14/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


class PaymentViewModel {
    var Repository = InsterementesRepositoryImp()
    let disposedBag = DisposeBag()
    
    private var respondData : PublishSubject<ResponseObjectModel<signUpDataModel>> = .init()
    lazy var respondDataObservable : Observable = respondData.asObservable()
    
    var amountToPay : BehaviorRelay<String> = .init(value: "")
    
    var errorMassage : BehaviorRelay<String> = .init(value: "")
    
    private var id : Int
    private var amount : String
    init(opertuniteId : Int, amount: String) {
        self.id = opertuniteId
        self.amount = amount
        amountToPay.accept(amount)
    }
    
    func sebsecribeToOppertunites(){
        if let userId = UserDefaults.standard.value(forKey: NetworkConstants.userIdKey) as? Int {
            let paramertes : [String : Any] = [
                "deal_id" : id,
                "user_id" : userId,
                "amount" : amount
            ]
            Repository.transactionAamount(parameters: paramertes).subscribe(onNext: { [weak self] (data) in
                guard let self = self else{return}
                self.respondData.onNext(data)
            }).disposed(by: disposedBag)
        }else{
            errorMassage.accept("You must log in first")
        }
    }
    
    
    
}
