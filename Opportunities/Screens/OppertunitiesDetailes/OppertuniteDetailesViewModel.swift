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

    var id : Int
    init(id: Int) {
        self.id = id
    }
       func viewDidlead(){
           getLetestoppertunites()
       }
       
       func getLetestoppertunites() {
           Repository.OppertuniteDetailes(oppertuniteId: id).subscribe(onNext: {(oppertunites) in
            guard let statuscode = oppertunites.code else {return}
            if statuscode == 200{
                guard let oppertuniteData = oppertunites.data else {return}
                self.OppertuniteDetailes.onNext(oppertuniteData)
            }else{
                print(oppertunites.msg)
            }
           },onError: { (error) in
               print(error)
           }).disposed(by: disposedBag)
       }
}
