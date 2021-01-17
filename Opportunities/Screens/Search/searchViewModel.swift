//
//  searchViewModel.swift
//  Opportunities
//
//  Created by youssef on 12/14/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class searchViewModel{
    var Repository = OppertunitesRepositoryImp()
    let disposedBag = DisposeBag()
    
    private  var OppertuniteDetailes : PublishSubject<[OppertunitesModel]> = .init()
    lazy var OppertuniteDetailesObservable : Observable<[OppertunitesModel]> = OppertuniteDetailes.asObservable()
    
    var searchText : BehaviorRelay<String> = .init(value: "")
    private var numberOfresulte : BehaviorRelay<Int> = .init(value: 0)
   lazy var numberOfresulteAsobservable : Observable = numberOfresulte.asObservable()
    func viewDidLoad() {
        getresulteOfResulte()
    }
    func getresulteOfResulte(){
        searchText.asObservable().distinctUntilChanged().subscribe(onNext: {[weak self] (searchData) in
            guard let self = self else {return}
            self.getLetestoppertunites(name: searchData)
        }).disposed(by: disposedBag)
    }
    
    
    func getLetestoppertunites(name : String) {
        Repository.OppertuniteSearch(oppertuniteName: name).subscribe(onNext: {(oppertunites) in
            guard let statuscode = oppertunites.code else {return}
            if statuscode == 200{
                guard let oppertuniteData = oppertunites.data else {return}
                self.OppertuniteDetailes.onNext(oppertuniteData)
                self.numberOfresulte.accept(oppertuniteData.count)
            }else{
                guard let massage = oppertunites.msg else {return}
                print(massage)
            }
        },onError: { (error) in
            print(error)
        }).disposed(by: disposedBag)
    }
}
