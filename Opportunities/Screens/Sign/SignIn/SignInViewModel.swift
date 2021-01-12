//
//  SignInViewModel.swift
//  Opportunities
//
//  Created by youssef on 12/18/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class SignInViewModel {
    var SeccessSignIn : PublishSubject<ResponseObjectModel<User>> = .init()

    var signRepository = SignRepositoryImp()
    let disposedBag = DisposeBag()
    var MessageError : BehaviorRelay<String> = BehaviorRelay.init(value: "")
    
    func ViewDidLoad(){
        
    }
    func Signin(parameters : Parameters) {
        
        signRepository.SignIn(parameters: parameters).subscribe(onNext: {[weak self] user in
            guard let self = self else {return}
            self.SeccessSignIn.onNext(user)
            
        }).disposed(by: disposedBag)
        
    }
}
