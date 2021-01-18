//
//  TransactionsViewMode.swift
//  Opportunities
//
//  Created by youssef on 1/11/21.
//  Copyright © 2021 youssef. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class TransactionsViewMode {
    var Repository = InsterementesRepositoryImp()
      let disposedBag = DisposeBag()
      
      private  var TransactionThisManth : PublishSubject<[TransactionModel]> = .init()
      lazy var TransactionThisManthObservable : Observable<[TransactionModel]> = TransactionThisManth.asObservable()
    private  var TransactionLastManth : PublishSubject<[TransactionModel]> = .init()
         lazy var TransactionLastManthObservable : Observable<[TransactionModel]> = TransactionLastManth.asObservable()
    
    var errorMassage : BehaviorRelay<String> = .init(value: "")
    
    func viewDidLoad() {
        GetTransactionThisMath()
        GetTransactionLastMath()
    }
    
    func GetTransactionThisMath(){
        if let userId = UserDefaults.standard.value(forKey: NetworkConstants.userIdKey) as? Int{
            Repository.TransactionThisManth(userId: userId).subscribe(onNext: { [weak self] (transaction) in
                guard let self = self else {return}
                if transaction.value == true{
                    guard let datathisManth = transaction.data else {return}
                    self.TransactionThisManth.onNext(datathisManth)
                }else{
                    guard let massage = transaction.msg else {return}
                    self.errorMassage.accept(massage)
                }
               
            }).disposed(by: disposedBag)
        }else{
            self.errorMassage.accept("you are logout please sign in to show all tranactions")
        }
    }
    
    
    func GetTransactionLastMath(){
        if let userId = UserDefaults.standard.value(forKey: NetworkConstants.userIdKey) as? Int{
            Repository.transactionLastMonth(userId: userId).subscribe(onNext: { [weak self] (transaction) in
                guard let self = self else {return}
                if transaction.value == true{
                    guard let datalastManth = transaction.data else {return}
                    self.TransactionLastManth.onNext(datalastManth)
                   
                }else{
                    guard let massage = transaction.msg else {return}
                    self.errorMassage.accept(massage)
                }
               
            }).disposed(by: disposedBag)
        }else{
            self.errorMassage.accept("please sign in to show all tranactions")
        }
    }
}
