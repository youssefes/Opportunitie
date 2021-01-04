//
//  OppertuniteDetailesViewModel.swift
//  Opportunities
//
//  Created by youssef on 12/14/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class OppertuniteDetailesViewModel {
    var Repository = OppertunitesRepositoryImp()
       let disposedBag = DisposeBag()
       
       private  var OppertuniteDetailes : PublishSubject<OppertunitesModel> = .init()
       lazy var OppertuniteDetailesObservable : Observable<OppertunitesModel> = OppertuniteDetailes.asObservable()

       func viewDidlead(){
           getLetestoppertunites()
       }
       
       func getLetestoppertunites() {
           Repository.OppertuniteDetailes(oppertuniteId: 8).subscribe(onNext: {(oppertunites) in
               self.OppertuniteDetailes.onNext(oppertunites)
           }).disposed(by: disposedBag)
       }
}
