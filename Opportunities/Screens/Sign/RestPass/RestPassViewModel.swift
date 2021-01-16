//
//  RestPassViewModel.swift
//  Opportunities
//
//  Created by youssef on 12/18/20.
//  Copyright © 2020 youssef. All rights reserved.
//
import Foundation
import RxSwift
import RxCocoa
import Alamofire

class RestPassViewModel {
    var signRepository = SignRepositoryImp()
       let disposedBag = DisposeBag()
       var SeccessSignUp : PublishSubject<ResponseObjectModel<signUpDataModel>> = .init()
       func ViewDidLoad(){
           
       }
        func ChangeRequest(parameters : Parameters) {
           signRepository.ChangePassRequest(parameters: parameters).subscribe(onNext: { [weak self](respond) in
               self?.SeccessSignUp.onNext(respond)
           },onError: { (error) in
                   print(error)
           },onCompleted: {
               print("commplet")
           }).disposed(by: disposedBag)
       }
}
