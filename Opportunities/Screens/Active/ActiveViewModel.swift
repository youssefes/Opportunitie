//
//  ActiveViewModel.swift
//  Opportunities
//
//  Created by youssef on 12/14/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class ActiveViewModel {
    var Repository = InsterementesRepositoryImp()
      let disposedBag = DisposeBag()
      
      private  var AllInsterementes : PublishSubject<[AllInstraments]> = .init()
      lazy var AllInsterementesObservable : Observable<[AllInstraments]> = AllInsterementes.asObservable()
    
    var errorMassage : BehaviorRelay<String> = .init(value: "")
    
    var numberOfInstrament : BehaviorRelay<Int> = .init(value: 0)
    
    
    func viewDidLoed() {
        getAllInstraments()
    }
    func getAllInstraments(){
        Repository.AllInsterementes(userId: 30).subscribe(onNext: { [weak self] (InstramentsData) in
            guard let self = self else{return}
            if InstramentsData.value == true{
                guard let data = InstramentsData.data else {return}
                self.numberOfInstrament.accept(data.count)
                self.AllInsterementes.onNext(data)
            }else{
                guard let massage = InstramentsData.msg else {return}
                self.errorMassage.accept(massage)
            }
            
        }).disposed(by: disposedBag)
    }
}
