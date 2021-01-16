//
//  ForgetPassViewModel.swift
//  Opportunities
//
//  Created by youssef on 12/18/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

class comformViewModel {
    
    var signRepository = SignRepositoryImp()
    let disposedBag = DisposeBag()
    var SeccessSignUp : PublishSubject<ResponseObjectModel<signUpDataModel>> = .init()
    func ViewDidLoad(){
        
    }
     func sendCode(parameters : Parameters) {
        signRepository.checkCodeActivEmail(parameters: parameters).subscribe(onNext: { [weak self](respond) in
            self?.SeccessSignUp.onNext(respond)
        },onError: { (error) in
                print(error)
        },onCompleted: {
            print("commplet")
        }).disposed(by: disposedBag)
    }
}
