//
//  AboutViewModel.swift
//  Opportunities
//
//  Created by youssef on 12/14/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class AboutViewModel {
    var Repository = OppertunitesRepositoryImp()
       let disposedBag = DisposeBag()
       private var Seccess: PublishSubject<ResponseObjectModel<[AboutModel]>> = .init()
       lazy var SeccessAbsercable : Observable = Seccess.asObservable()
    
    func ViewDidLoad(){
        sendRequest()
    }
    private func sendRequest(){
        Repository.About().subscribe(onNext: { [weak self] (respond) in
            guard let self = self else {return}
            self.Seccess.onNext(respond)
        }).disposed(by: disposedBag)
    }
}
