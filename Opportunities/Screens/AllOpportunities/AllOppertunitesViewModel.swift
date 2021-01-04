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
    
    func viewDidlead(){
        getLetestoppertunites()
    }
    
   private func getLetestoppertunites() {
        Repository.letestOppertunites().subscribe(onNext: {(oppertunites) in
            self.allOppertunites.onNext(oppertunites)
        }).disposed(by: disposedBag)
    }
}
