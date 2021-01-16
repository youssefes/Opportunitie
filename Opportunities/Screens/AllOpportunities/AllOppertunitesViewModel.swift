//
//  AllOppertunitesViewModel.swift
//  Opportunities
//
//  Created by youssef on 12/14/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class AllOppertunitesViewModel {
    var Repository = OppertunitesRepositoryImp()
    let disposedBag = DisposeBag()
    
    private  var allOppertunites : PublishSubject<[OppertunitesModel]> = .init()
    lazy var allOppertunitesObservable : Observable<[OppertunitesModel]> = allOppertunites.asObservable()
    
    var numberOfAppartunites : BehaviorSubject<Int> = .init(value: 0)
    
    func viewDidlead(){
        getLetestoppertunites()
    }
    
   private func getLetestoppertunites() {
        Repository.allOppertunites().subscribe(onNext: {(oppertunites) in
            self.allOppertunites.onNext(oppertunites)
            self.numberOfAppartunites.onNext(oppertunites.count)
        }).disposed(by: disposedBag)
    }
}
