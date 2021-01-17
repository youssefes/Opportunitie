//
//  settingViewModel.swift
//  Opportunities
//
//  Created by youssef on 1/10/21.
//  Copyright © 2021 youssef. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class settingViewModel  {
    
    var signRepository = SignRepositoryImp()
    let disposedBag = DisposeBag()
    
    private var SeccessUpdate : PublishSubject<signUpDataModel> = .init()
    lazy var SeccessUpdateAbservable : Observable = SeccessUpdate.asObservable()
    func updataProfile(parameter : Parameters, image : Data) {
        signRepository.updataProfile(parmater: parameter, image: image).subscribe(onNext: { [weak self](resulte) in
            guard let self = self else{return}
            self.SeccessUpdate.onNext(resulte)
        }).disposed(by: disposedBag)
    }
    
}
