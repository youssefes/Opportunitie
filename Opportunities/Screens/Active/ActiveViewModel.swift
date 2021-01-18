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
    var activeRpository = OppertunitesRepositoryImp()
    let disposedBag = DisposeBag()
    
    private  var AllInsterementes : PublishSubject<[AllInstraments]> = .init()
    lazy var AllInsterementesObservable : Observable<[AllInstraments]> = AllInsterementes.asObservable()
    
    private  var OppertuniteDetailes : PublishSubject<[OppertunitesModel]> = .init()
    lazy var OppertuniteDetailesObservable : Observable<[OppertunitesModel]> = OppertuniteDetailes.asObservable()
    
    var errorMassage : BehaviorRelay<String> = .init(value: "")
    
    var numberOfInstrament : BehaviorRelay<Int> = .init(value: 0)
    
    
    func viewDidLoed() {
        getAllInstraments()
    }
    func getAllInstraments(){
        
        if let userId = UserDefaults.standard.value(forKey: NetworkConstants.userIdKey) as? Int {
            
            activeRpository.activeOppertunites(userId: userId).subscribe(onNext: { (oppertunites) in
                guard let statuscode = oppertunites.code else {return}
                if statuscode == 200{
                    guard let oppertuniteData = oppertunites.data else {return}
                    self.OppertuniteDetailes.onNext(oppertuniteData)
                }else{
                    guard let massage = oppertunites.msg else {return}
                    self.errorMassage.accept(massage)
                }
            }).disposed(by: disposedBag)
            
            
            Repository.AllInsterementes(userId: userId).subscribe(onNext: { [weak self] (InstramentsData) in
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
            
        }else{
            errorMassage.accept("You must log in first")
        }
    }
}
