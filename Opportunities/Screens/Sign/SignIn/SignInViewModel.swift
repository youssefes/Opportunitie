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
    var SeccessSignIn : PublishSubject<User> = .init()
    var signRepository = SignRepositoryImp()
    let disposedBag = DisposeBag()
    
    func ViewDidLoad(){
        
    }
    func Signin(parameters : Parameters) {
        
        signRepository.SignIn(parameters: parameters).subscribe(onNext: { user in
            guard let statuscode = user.code else {return}
            if statuscode == 200{
                guard let userData = user.data else {return}
                self.SeccessSignIn.onNext(userData)
            }else{
                print(user.msg)
            }
            
        }).disposed(by: disposedBag)
        
    }
}
