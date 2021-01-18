//
//  ContectUsViewModel.swift
//  Opportunities
//
//  Created by youssef on 12/14/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class ContectUsViewModel {
    var signRepository = SignRepositoryImp()
    let disposedBag = DisposeBag()
    private var SeccessSendMassage : PublishSubject<ResponseObjectModel<signUpDataModel>> = .init()
    lazy var SeccessSendMassageAbsercable : Observable<ResponseObjectModel<signUpDataModel>> = SeccessSendMassage.asObservable()
    func ViewDidLoad(){
        
    }
    func ContectUs(parameters : Parameters) {
        signRepository.ContectUs(parameters: parameters).subscribe(onNext: { [weak self] (data) in
            guard let self = self else {return}
            self.SeccessSendMassage.onNext(data)
        }).disposed(by: disposedBag)
    }
}
