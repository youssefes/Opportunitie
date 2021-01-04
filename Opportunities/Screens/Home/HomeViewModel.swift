//
//  HomeViewModel.swift
//  Opportunities
//
//  Created by youssef on 12/14/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift


class HomeViewModel {
    var Repository = OppertunitesRepositoryImp()
    let disposedBag = DisposeBag()
    
    private  var letestOppertunites : PublishSubject<[OppertunitesModel]> = .init()
    lazy var letestOppertunitesObservable : Observable<[OppertunitesModel]> = letestOppertunites.asObservable()

    func viewDidlead(){
        getLetestoppertunites()
    }
    
    func getLetestoppertunites() {
        Repository.letestOppertunites().subscribe(onNext: {(oppertunites) in
            self.letestOppertunites.onNext(oppertunites)
        }).disposed(by: disposedBag)
    }
}
