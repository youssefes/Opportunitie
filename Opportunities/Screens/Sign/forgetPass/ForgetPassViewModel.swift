//
//  ForgetPassViewModel.swift
//  Opportunities
//
//  Created by youssef on 12/18/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire


class ForgetPassViewModel{
    var signRepository = SignRepositoryImp()
    let disposedBag = DisposeBag()
    var SeccessSignUp : PublishSubject<signUpDataModel> = .init()
    func ViewDidLoad(){
        
    }
     func ForgetPassRequest(parameters : Parameters) {
        signRepository.forgetPassRequest(parameters: parameters).subscribe(onNext: { [weak self](respond) in
            self?.SeccessSignUp.onNext(respond)
        },onError: { (error) in
                print(error)
        },onCompleted: {
            print("commplet")
        }).disposed(by: disposedBag)
    }
}
