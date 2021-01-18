//
//  InsterementesRepository.swift
//  Opportunities
//
//  Created by youssef on 1/17/21.
//  Copyright © 2021 youssef. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire


protocol InsterementesRepository {
     func AllInsterementes(userId : Int) -> Observable<ResponseObjectModel<[AllInstraments]>>
    
}

class InsterementesRepositoryImp: InsterementesRepository {
   
    let networkClient : NetworkClient
    init(networkClient : NetworkClient = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    func AllInsterementes(userId : Int) -> Observable<ResponseObjectModel<[AllInstraments]>> {
           Observable<ResponseObjectModel<[AllInstraments]>>.create{[weak self] (oppertunites) -> Disposable in
            self?.networkClient.performRequest([AllInstraments].self, router: InstrementsRouter.AllInstraments(userId: userId)) { (resulet) in
                   switch resulet{
                   case .success(let data):
                    oppertunites.onNext(data)
                   case .failure(let error):
                       oppertunites.onError(error)
                   }
               }
               
               return Disposables.create()
           }
       }
    
    func TransactionThisManth(userId : Int) -> Observable<ResponseObjectModel<[TransactionModel]>> {
        Observable<ResponseObjectModel<[TransactionModel]>>.create{[weak self] (oppertunites) -> Disposable in
         self?.networkClient.performRequest([TransactionModel].self, router: InstrementsRouter.transactionThisMonth(userId: userId)) { (resulet) in
                switch resulet{
                case .success(let data):
                 oppertunites.onNext(data)
                case .failure(let error):
                    oppertunites.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
    
    func transactionLastMonth(userId : Int) -> Observable<ResponseObjectModel<[TransactionModel]>> {
        Observable<ResponseObjectModel<[TransactionModel]>>.create{[weak self] (oppertunites) -> Disposable in
         self?.networkClient.performRequest([TransactionModel].self, router: InstrementsRouter.transactionLastMonth(userId: userId)) { (resulet) in
                switch resulet{
                case .success(let data):
                 oppertunites.onNext(data)
                case .failure(let error):
                    oppertunites.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
    
    func transactionAamount(parameters : Parameters ) -> Observable<ResponseObjectModel<signUpDataModel>> {
        Observable<ResponseObjectModel<signUpDataModel>>.create { [weak self] (items) -> Disposable in
            self?.networkClient.performRequest(signUpDataModel.self, router: InstrementsRouter.transactionAmount(parameters: parameters)) { (resulte) in
                switch resulte{
                case .success(let data):
                    items.onNext(data)
                    items.onCompleted()
                case .failure(let error):
                    items.onError(error)
                }
            }
            return Disposables.create()
        }
        
    }
    
    
    
    
    
}
