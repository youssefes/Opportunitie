//
//  SignUpViewModel.swift
//  Opportunities
//
//  Created by youssef on 12/18/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

class SignUpViewModel {
    

    var signRepository = SignRepositoryImp()
    let disposedBag = DisposeBag()
    private var SeccessSignUp : PublishSubject<ResponseObjectModel<signUpDataModel>> = .init()
    lazy var SeccessSignUpAbsercable : Observable<ResponseObjectModel<signUpDataModel>> = SeccessSignUp.asObservable()
    func ViewDidLoad(){
        
    }
    func SignUp(parameters : Parameters) {
        signRepository.SignUp(parameters: parameters).subscribe(onNext: { [weak self] (data) in
            guard let self = self else {return}
            self.SeccessSignUp.onNext(data)
        }).disposed(by: disposedBag)
    }
}
